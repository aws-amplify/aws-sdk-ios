/* LibTomMath, multiple-precision integer library -- Tom St Denis
 *
 * LibTomMath is a library that provides multiple-precision
 * integer arithmetic as well as number theoretic functionality.
 *
 * The library was designed directly after the MPI library by
 * Michael Fromberger but has been written from scratch with
 * additional optimizations in place.
 *
 * The library is free for all purposes without any express
 * guarantee it works.
 *
 * Tom St Denis, tomstdenis@gmail.com, http://math.libtomcrypt.com
 */
#ifndef AWS_BN_H_
#define AWS_BN_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <limits.h>

#include "aws_tommath_class.h"

#ifndef AWS_MIN
   #define AWS_MIN(x,y) ((x)<(y)?(x):(y))
#endif

#ifndef AWS_MAX
   #define AWS_MAX(x,y) ((x)>(y)?(x):(y))
#endif

#ifdef __cplusplus
extern "C" {

/* C++ compilers don't like assigning void * to mp_digit * */
#define  AWS_OPT_CAST(x)  (x *)

#else

/* C on the other hand doesn't care */
#define  AWS_OPT_CAST(x)

#endif


/* detect 64-bit mode if possible */
#if defined(__x86_64__) 
   #if !(defined(AWS_MP_64BIT) && defined(AWS_MP_16BIT) && defined(AWS_MP_8BIT))
      #define AWS_MP_64BIT
   #endif
#endif

/* some default configurations.
 *
 * A "mp_digit" must be able to hold AWS_DIGIT_BIT + 1 bits
 * A "mp_word" must be able to hold 2*AWS_DIGIT_BIT + 1 bits
 *
 * At the very least a mp_digit must be able to hold 7 bits
 * [any size beyond that is ok provided it doesn't overflow the data type]
 */
#ifdef AWS_MP_8BIT
   typedef unsigned char      aws_mp_digit;
   typedef unsigned short     aws_mp_word;
#elif defined(AWS_MP_16BIT)
   typedef unsigned short     aws_mp_digit;
   typedef unsigned long      aws_mp_word;
#elif defined(AWS_MP_64BIT)
   /* for GCC only on supported platforms */
#ifndef CRYPT
   typedef unsigned long long ulong64;
   typedef signed long long   long64;
#endif

   typedef unsigned long      aws_mp_digit;
   typedef unsigned long      aws_mp_word __attribute__ ((mode(TI)));

   #define AWS_DIGIT_BIT          60
#else
   /* this is the default case, 28-bit digits */
   
   /* this is to make porting into LibTomCrypt easier :-) */
#ifndef CRYPT
   #if defined(_MSC_VER) || defined(__BORLANDC__) 
      typedef unsigned __int64   ulong64;
      typedef signed __int64     long64;
   #else
      typedef unsigned long long ulong64;
      typedef signed long long   long64;
   #endif
#endif

   typedef unsigned long      aws_mp_digit;
   typedef ulong64            aws_mp_word;

#ifdef AWS_MP_31BIT
   /* this is an extension that uses 31-bit digits */
   #define AWS_DIGIT_BIT          31
#else
   /* default case is 28-bit digits, defines MP_28BIT as a handy macro to test */
   #define AWS_DIGIT_BIT          28
   #define AWS_MP_28BIT
#endif   
#endif

/* define heap macros */
#ifndef CRYPT
   /* default to libc stuff */
   #ifndef AWS_XMALLOC
       #define AWS_XMALLOC  malloc
       #define AWS_XFREE    free
       #define AWS_XREALLOC realloc
       #define AWS_XCALLOC  calloc
   #else
      /* prototypes for our heap functions */
      extern void *AWS_XMALLOC(size_t n);
      extern void *AWS_XREALLOC(void *p, size_t n);
      extern void *AWS_XCALLOC(size_t n, size_t s);
      extern void AWS_XFREE(void *p);
   #endif
#endif


/* otherwise the bits per digit is calculated automatically from the size of a mp_digit */
#ifndef AWS_DIGIT_BIT
   #define AWS_DIGIT_BIT     ((int)((AWS_CHAR_BIT * sizeof(aws_mp_digit) - 1)))  /* bits per digit */
#endif

#define AWS_MP_DIGIT_BIT     AWS_DIGIT_BIT
#define AWS_MP_MASK          ((((aws_mp_digit)1)<<((aws_mp_digit)AWS_DIGIT_BIT))-((aws_mp_digit)1))
#define AWS_MP_DIGIT_MAX     AWS_MP_MASK

/* equalities */
#define AWS_MP_LT        -1   /* less than */
#define AWS_MP_EQ         0   /* equal to */
#define AWS_MP_GT         1   /* greater than */

#define AWS_MP_ZPOS       0   /* positive integer */
#define AWS_MP_NEG        1   /* negative */

#define AWS_MP_OKAY       0   /* ok result */
#define AWS_MP_MEM        -2  /* out of mem */
#define AWS_MP_VAL        -3  /* invalid input */
#define AWS_MP_RANGE      AWS_MP_VAL

#define AWS_MP_YES        1   /* yes response */
#define AWS_MP_NO         0   /* no response */

/* Primality generation flags */
#define AWS_LTM_PRIME_BBS      0x0001 /* BBS style prime */
#define AWS_LTM_PRIME_SAFE     0x0002 /* Safe prime (p-1)/2 == prime */
#define AWS_LTM_PRIME_2MSB_ON  0x0008 /* force 2nd MSB to 1 */

typedef int aws_mp_err;

/* you'll have to tune these... */
extern int AWS_KARATSUBA_MUL_CUTOFF,
        AWS_KARATSUBA_SQR_CUTOFF,
        AWS_TOOM_MUL_CUTOFF,
        AWS_TOOM_SQR_CUTOFF;

/* define this to use lower memory usage routines (exptmods mostly) */
/* #define AWS_MP_LOW_MEM */

/* default precision */
#ifndef AWS_MP_PREC
   #ifndef AWS_MP_LOW_MEM
      #define AWS_MP_PREC                 32     /* default digits of precision */
   #else
      #define AWS_MP_PREC                 8      /* default digits of precision */
   #endif   
#endif

/* size of comba arrays, should be at least 2 * 2**(BITS_PER_WORD - BITS_PER_DIGIT*2) */
#define AWS_MP_WARRAY               (1 << (sizeof(aws_mp_word) * CHAR_BIT - 2 * AWS_DIGIT_BIT + 1))

/* the infamous mp_int structure */
typedef struct  {
    int used, alloc, sign;
    aws_mp_digit *dp;
} aws_mp_int;

/* callback for mp_prime_random, should fill dst with random bytes and return how many read [upto len] */
typedef int aws_ltm_prime_callback(unsigned char *dst, int len, void *dat);


#define AWS_JKTM_USED(m)    ((m)->used)
#define AWS_JKTM_DIGIT(m,k) ((m)->dp[(k)])
#define AWS_JKTM_SIGN(m)    ((m)->sign)

/* error code to char* string */
char *aws_mp_error_to_string(int code);

/* ---> init and deinit bignum functions <--- */
/* init a bignum */
int aws_mp_init(aws_mp_int *a);

/* free a bignum */
void aws_mp_clear(aws_mp_int *a);

/* init a null terminated series of arguments */
int aws_mp_init_multi(aws_mp_int *mp, ...);

/* clear a null terminated series of arguments */
void aws_mp_clear_multi(aws_mp_int *mp, ...);

/* exchange two ints */
void aws_mp_exch(aws_mp_int *a, aws_mp_int *b);

/* shrink ram required for a bignum */
int aws_mp_shrink(aws_mp_int *a);

/* grow an int to a given size */
int aws_mp_grow(aws_mp_int *a, int size);

/* init to a given number of digits */
int aws_mp_init_size(aws_mp_int *a, int size);

/* ---> Basic Manipulations <--- */
#define aws_mp_iszero(a) (((a)->used == 0) ? AWS_MP_YES : AWS_MP_NO)
#define aws_mp_iseven(a) (((a)->used > 0 && (((a)->dp[0] & 1) == 0)) ? AWS_MP_YES : AWS_MP_NO)
#define aws_mp_isodd(a)  (((a)->used > 0 && (((a)->dp[0] & 1) == 1)) ? AWS_MP_YES : AWS_MP_NO)

/* set to zero */
void aws_mp_zero(aws_mp_int *a);

/* set to a digit */
void aws_mp_set(aws_mp_int *a, aws_mp_digit b);

/* set a 32-bit const */
int aws_mp_set_int(aws_mp_int *a, unsigned long b);

/* get a 32-bit value */
unsigned long aws_mp_get_int(aws_mp_int *a);

/* initialize and set a digit */
int aws_mp_init_set(aws_mp_int *a, aws_mp_digit b);

/* initialize and set 32-bit value */
int aws_mp_init_set_int(aws_mp_int *a, unsigned long b);

/* copy, b = a */
int aws_mp_copy(aws_mp_int *a, aws_mp_int *b);

/* inits and copies, a = b */
int aws_mp_init_copy(aws_mp_int *a, aws_mp_int *b);

/* trim unused digits */
void aws_mp_clamp(aws_mp_int *a);

/* ---> digit manipulation <--- */

/* right shift by "b" digits */
void aws_mp_rshd(aws_mp_int *a, int b);

/* left shift by "b" digits */
int aws_mp_lshd(aws_mp_int *a, int b);

/* c = a / 2**b */
int aws_mp_div_2d(aws_mp_int *a, int b, aws_mp_int *c, aws_mp_int *d);

/* b = a/2 */
int aws_mp_div_2(aws_mp_int *a, aws_mp_int *b);

/* c = a * 2**b */
int aws_mp_mul_2d(aws_mp_int *a, int b, aws_mp_int *c);

/* b = a*2 */
int aws_mp_mul_2(aws_mp_int *a, aws_mp_int *b);

/* c = a mod 2**d */
int aws_mp_mod_2d(aws_mp_int *a, int b, aws_mp_int *c);

/* computes a = 2**b */
int aws_mp_2expt(aws_mp_int *a, int b);

/* Counts the number of lsbs which are zero before the first zero bit */
int aws_mp_cnt_lsb(aws_mp_int *a);

/* I Love Earth! */

/* makes a pseudo-random int of a given size */
int aws_mp_rand(aws_mp_int *a, int digits);

/* ---> binary operations <--- */
/* c = a XOR b  */
int aws_mp_xor(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* c = a OR b */
int aws_mp_or(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* c = a AND b */
int aws_mp_and(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* ---> Basic arithmetic <--- */

/* b = -a */
int aws_mp_neg(aws_mp_int *a, aws_mp_int *b);

/* b = |a| */
int aws_mp_abs(aws_mp_int *a, aws_mp_int *b);

/* compare a to b */
int aws_mp_cmp(aws_mp_int *a, aws_mp_int *b);

/* compare |a| to |b| */
int aws_mp_cmp_mag(aws_mp_int *a, aws_mp_int *b);

/* c = a + b */
int aws_mp_add(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* c = a - b */
int aws_mp_sub(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* c = a * b */
int aws_mp_mul(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* b = a*a  */
int aws_mp_sqr(aws_mp_int *a, aws_mp_int *b);

/* a/b => cb + d == a */
int aws_mp_div(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, aws_mp_int *d);

/* c = a mod b, 0 <= c < b  */
int aws_mp_mod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* ---> single digit functions <--- */

/* compare against a single digit */
int aws_mp_cmp_d(aws_mp_int *a, aws_mp_digit b);

/* c = a + b */
int aws_mp_add_d(aws_mp_int *a, aws_mp_digit b, aws_mp_int *c);

/* c = a - b */
int aws_mp_sub_d(aws_mp_int *a, aws_mp_digit b, aws_mp_int *c);

/* c = a * b */
int aws_mp_mul_d(aws_mp_int *a, aws_mp_digit b, aws_mp_int *c);

/* a/b => cb + d == a */
int aws_mp_div_d(aws_mp_int *a, aws_mp_digit b, aws_mp_int *c, aws_mp_digit *d);

/* a/3 => 3c + d == a */
int aws_mp_div_3(aws_mp_int *a, aws_mp_int *c, aws_mp_digit *d);

/* c = a**b */
int aws_mp_expt_d(aws_mp_int *a, aws_mp_digit b, aws_mp_int *c);

/* c = a mod b, 0 <= c < b  */
int aws_mp_mod_d(aws_mp_int *a, aws_mp_digit b, aws_mp_digit *c);

/* ---> number theory <--- */

/* d = a + b (mod c) */
int aws_mp_addmod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, aws_mp_int *d);

/* d = a - b (mod c) */
int aws_mp_submod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, aws_mp_int *d);

/* d = a * b (mod c) */
int aws_mp_mulmod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, aws_mp_int *d);

/* c = a * a (mod b) */
int aws_mp_sqrmod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* c = 1/a (mod b) */
int aws_mp_invmod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* c = (a, b) */
int aws_mp_gcd(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* produces value such that U1*a + U2*b = U3 */
int aws_mp_exteuclid(aws_mp_int *a, aws_mp_int *b, aws_mp_int *U1, aws_mp_int *U2, aws_mp_int *U3);

/* c = [a, b] or (a*b)/(a, b) */
int aws_aws_mp_lcm(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* finds one of the b'th root of a, such that |c|**b <= |a|
 *
 * returns error if a < 0 and b is even
 */
int aws_mp_n_root(aws_mp_int *a, aws_mp_digit b, aws_mp_int *c);

/* special sqrt algo */
int aws_mp_sqrt(aws_mp_int *arg, aws_mp_int *ret);

/* is number a square? */
int aws_mp_is_square(aws_mp_int *arg, int *ret);

/* computes the jacobi c = (a | n) (or Legendre if b is prime)  */
int aws_mp_jacobi(aws_mp_int *a, aws_mp_int *n, int *c);

/* used to setup the Barrett reduction for a given modulus b */
int aws_mp_reduce_setup(aws_mp_int *a, aws_mp_int *b);

/* Barrett Reduction, computes a (mod b) with a precomputed value c
 *
 * Assumes that 0 < a <= b*b, note if 0 > a > -(b*b) then you can merely
 * compute the reduction as -1 * aws_mp_reduce(aws_mp_abs(a)) [pseudo code].
 */
int aws_mp_reduce(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);

/* setups the montgomery reduction */
int aws_mp_montgomery_setup(aws_mp_int *a, aws_mp_digit *mp);

/* computes a = B**n mod b without division or multiplication useful for
 * normalizing numbers in a Montgomery system.
 */
int aws_mp_montgomery_calc_normalization(aws_mp_int *a, aws_mp_int *b);

/* computes x/R == x (mod N) via Montgomery Reduction */
int aws_mp_montgomery_reduce(aws_mp_int *a, aws_mp_int *m, aws_mp_digit mp);

/* returns 1 if a is a valid DR modulus */
int aws_mp_dr_is_modulus(aws_mp_int *a);

/* sets the value of "d" required for aws_mp_dr_reduce */
void aws_mp_dr_setup(aws_mp_int *a, aws_mp_digit *d);

/* reduces a modulo b using the Diminished Radix method */
int aws_mp_dr_reduce(aws_mp_int *a, aws_mp_int *b, aws_mp_digit mp);

/* returns true if a can be reduced with aws_mp_reduce_2k */
int aws_mp_reduce_is_2k(aws_mp_int *a);

/* determines k value for 2k reduction */
int aws_mp_reduce_2k_setup(aws_mp_int *a, aws_mp_digit *d);

/* reduces a modulo b where b is of the form 2**p - k [0 <= a] */
int aws_mp_reduce_2k(aws_mp_int *a, aws_mp_int *n, aws_mp_digit d);

/* returns true if a can be reduced with aws_mp_reduce_2k_l */
int aws_mp_reduce_is_2k_l(aws_mp_int *a);

/* determines k value for 2k reduction */
int aws_mp_reduce_2k_setup_l(aws_mp_int *a, aws_mp_int *d);

/* reduces a modulo b where b is of the form 2**p - k [0 <= a] */
int aws_mp_reduce_2k_l(aws_mp_int *a, aws_mp_int *n, aws_mp_int *d);

/* d = a**b (mod c) */
int aws_mp_exptmod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, aws_mp_int *d);

/* ---> Primes <--- */

/* number of primes */
#ifdef AWS_MP_8BIT
   #define AWS_JKTM_PRIME_SIZE      31
#else
   #define AWS_JKTM_PRIME_SIZE      256
#endif

/* table of first AWS_JKTM_PRIME_SIZE primes */
extern const aws_mp_digit aws_ltm_prime_tab[];

/* result=1 if a is divisible by one of the first AWS_JKTM_PRIME_SIZE primes */
int aws_mp_prime_is_divisible(aws_mp_int *a, int *result);

/* performs one Fermat test of "a" using base "b".
 * Sets result to 0 if composite or 1 if probable prime
 */
int aws_mp_prime_fermat(aws_mp_int *a, aws_mp_int *b, int *result);

/* performs one Miller-Rabin test of "a" using base "b".
 * Sets result to 0 if composite or 1 if probable prime
 */
int aws_mp_prime_miller_rabin(aws_mp_int *a, aws_mp_int *b, int *result);

/* This gives [for a given bit size] the number of trials required
 * such that Miller-Rabin gives a prob of failure lower than 2^-96 
 */
int aws_mp_prime_rabin_miller_trials(int size);

/* performs t rounds of Miller-Rabin on "a" using the first
 * t prime bases.  Also performs an initial sieve of trial
 * division.  Determines if "a" is prime with probability
 * of error no more than (1/4)**t.
 *
 * Sets result to 1 if probably prime, 0 otherwise
 */
int aws_mp_prime_is_prime(aws_mp_int *a, int t, int *result);

/* finds the next prime after the number "a" using "t" trials
 * of Miller-Rabin.
 *
 * bbs_style = 1 means the prime must be congruent to 3 mod 4
 */
int aws_mp_prime_next_prime(aws_mp_int *a, int t, int bbs_style);

/* makes a truly random prime of a given size (bytes),
 * call with bbs = 1 if you want it to be congruent to 3 mod 4 
 *
 * You have to supply a callback which fills in a buffer with random bytes.  "dat" is a parameter you can
 * have passed to the callback (e.g. a state or something).  This function doesn't use "dat" itself
 * so it can be NULL
 *
 * The prime generated will be larger than 2^(8*size).
 */
#define mp_prime_random(a, t, size, bbs, cb, dat) mp_prime_random_ex(a, t, ((size) * 8) + 1, (bbs==1)?AWS_LTM_PRIME_BBS:0, cb, dat)

/* makes a truly random prime of a given size (bits),
 *
 * Flags are as follows:
 * 
 *   AWS_LTM_PRIME_BBS      - make prime congruent to 3 mod 4
 *   AWS_LTM_PRIME_SAFE     - make sure (p-1)/2 is prime as well (implies AWS_LTM_PRIME_BBS)
 *   AWS_LTM_PRIME_2MSB_OFF - make the 2nd highest bit zero
 *   AWS_LTM_PRIME_2MSB_ON  - make the 2nd highest bit one
 *
 * You have to supply a callback which fills in a buffer with random bytes.  "dat" is a parameter you can
 * have passed to the callback (e.g. a state or something).  This function doesn't use "dat" itself
 * so it can be NULL
 *
 */
int aws_mp_prime_random_ex(aws_mp_int *a, int t, int size, int flags, aws_ltm_prime_callback cb, void *dat);

/* ---> radix conversion <--- */
int aws_mp_count_bits(aws_mp_int *a);

int aws_mp_unsigned_bin_size(aws_mp_int *a);
int aws_mp_read_unsigned_bin(aws_mp_int *a, const unsigned char *b, int c);
int aws_mp_to_unsigned_bin(aws_mp_int *a, unsigned char *b);
int aws_mp_to_unsigned_bin_n(aws_mp_int *a, unsigned char *b, unsigned long *outlen);

int aws_mp_signed_bin_size(aws_mp_int *a);
int aws_mp_read_signed_bin(aws_mp_int *a, const unsigned char *b, int c);
int aws_mp_to_signed_bin(aws_mp_int *a, unsigned char *b);
int aws_mp_to_signed_bin_n(aws_mp_int *a, unsigned char *b, unsigned long *outlen);

int aws_mp_read_radix(aws_mp_int *a, const char *str, int radix);
int aws_mp_toradix(aws_mp_int *a, char *str, int radix);
int aws_mp_toradix_n(aws_mp_int *a, char *str, int radix, int maxlen);
int aws_mp_radix_size(aws_mp_int *a, int radix, int *size);

int aws_mp_fread(aws_mp_int *a, int radix, FILE *stream);
int aws_mp_fwrite(aws_mp_int *a, int radix, FILE *stream);

#define mp_read_raw(mp, str, len) mp_read_signed_bin((mp), (str), (len))
#define mp_raw_size(mp)           mp_signed_bin_size(mp)
#define mp_toraw(mp, str)         mp_to_signed_bin((mp), (str))
#define mp_read_mag(mp, str, len) mp_read_unsigned_bin((mp), (str), (len))
#define mp_mag_size(mp)           mp_unsigned_bin_size(mp)
#define mp_tomag(mp, str)         mp_to_unsigned_bin((mp), (str))

#define mp_tobinary(M, S)  mp_toradix((M), (S), 2)
#define mp_tooctal(M, S)   mp_toradix((M), (S), 8)
#define mp_todecimal(M, S) mp_toradix((M), (S), 10)
#define mp_tohex(M, S)     mp_toradix((M), (S), 16)

/* lowlevel functions, do not call! */
int aws_s_mp_add(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);
int aws_s_mp_sub(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);
#define aws_s_mp_mul(a, b, c) aws_s_mp_mul_digs(a, b, c, (a)->used + (b)->used + 1)
int aws_fast_s_mp_mul_digs(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, int digs);
int aws_s_mp_mul_digs(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, int digs);
int aws_fast_s_mp_mul_high_digs(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, int digs);
int aws_s_mp_mul_high_digs(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c, int digs);
int aws_fast_s_mp_sqr(aws_mp_int *a, aws_mp_int *b);
int aws_s_mp_sqr(aws_mp_int *a, aws_mp_int *b);
int aws_mp_karatsuba_mul(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);
int aws_mp_toom_mul(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);
int aws_mp_karatsuba_sqr(aws_mp_int *a, aws_mp_int *b);
int aws_mp_toom_sqr(aws_mp_int *a, aws_mp_int *b);
int aws_fast_mp_invmod(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);
int aws_mp_invmod_slow(aws_mp_int *a, aws_mp_int *b, aws_mp_int *c);
int aws_fast_mp_montgomery_reduce(aws_mp_int *a, aws_mp_int *m, aws_mp_digit mp);
int aws_mp_exptmod_fast(aws_mp_int *G, aws_mp_int *X, aws_mp_int *P, aws_mp_int *Y, int mode);
int aws_s_mp_exptmod(aws_mp_int *G, aws_mp_int *X, aws_mp_int *P, aws_mp_int *Y, int mode);
void aws_bn_reverse(unsigned char *s, int len);

extern const char *aws_mp_s_rmap;

#ifdef __cplusplus
   }
#endif

#endif


/* $Source$ */
/* $Revision: 0.39 $ */
/* $Date: 2006-04-06 19:49:59 +0000 $ */

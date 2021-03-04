#ifndef ARM_AARCH64_ASM
#define ARM_AARCH64_ASM

#define __ASM__

#define BEGIN_FN(_name) \
    .global _name; \
    .type _name,%function; \
_name:

#define END_FN(_name) \
    .size .-name;


#endif /*ARM_AARCH64_ASM*/
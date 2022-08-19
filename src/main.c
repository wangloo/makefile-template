/**
 * \file     main.c
 * 
 * \details    
 * 
 * \author   Wang Lu
 * 
 * \date     2022-08-06
 *         
 * \lastmod    
 */

#include <stdio.h>
#include "foobar.h"

int main() {
    foo();
    bar();
#ifdef EXTDEFS_ENABLE
    printf("Including external definitions\n");
    printf("Build time: %s\n", COMPILE_TIME);
    printf("Git HEAD hash value: %s\n", GIT_HEAD);
#else 
    printf("Disable external definitions!!\n");
#endif
    return 0;
}

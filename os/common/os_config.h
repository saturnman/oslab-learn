#ifndef OS_CONFIG_H
#define OS_CONFIG_H
// memory config
#define PAGE_SHIFT	 		    12
#define TABLE_SHIFT 			9
#define SECTION_SHIFT			(PAGE_SHIFT + TABLE_SHIFT)

#define PAGE_SIZE   			(1 << PAGE_SHIFT)	/* 4k page */
#define SECTION_SIZE			(1 << SECTION_SHIFT)	/* 512 pages */

#define LOW_MEMORY              	(2 * SECTION_SIZE)
//

#endif /* OS_CONFIG_H */
/* test.c ---
 *
 * Filename: test.c
 * Description:
 * Author: Liu Enze
 * Maintainer:
 * Created: Thu Nov 27 22:50:06 2014 (+0800)
 * Version:
 * Package-Requires: ()
 * Last-Updated: Thu Nov 27 22:50:09 2014 (+0800)
 *           By: Liu Enze
 *     Update #: 1
 * URL:
 * Doc URL:
 * Keywords:
 * Compatibility:
 *
 */

/* Commentary:
 *
 *
 *
 */

/* Change Log:
 *
 *
 */

/* This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or (at
 * your option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
 */

/* Code: */


#include <stdio.h>
#include <math.h>
#include <string.h>

int f(int x)
{
    return x * x;
}

int g(int (*func)(int), int x)
{
    return (*func)(x + 1) + (*func)(x - 1);
}

int main()
{
    printf("%d\n", g(f, 5));
    if(1)
      printf("test\n");

    printf("%d\n",(int)strlen("test"));
    return 0;
}

/* test.c ends here */

/*___INFO__MARK_BEGIN__*/
/*************************************************************************
 * 
 *  The Contents of this file are made available subject to the terms of
 *  the Sun Industry Standards Source License Version 1.2
 * 
 *  Sun Microsystems Inc., March, 2001
 * 
 * 
 *  Sun Industry Standards Source License Version 1.2
 *  =================================================
 *  The contents of this file are subject to the Sun Industry Standards
 *  Source License Version 1.2 (the "License"); You may not use this file
 *  except in compliance with the License. You may obtain a copy of the
 *  License at http://gridengine.sunsource.net/Gridengine_SISSL_license.html
 * 
 *  Software provided under this License is provided on an "AS IS" basis,
 *  WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING,
 *  WITHOUT LIMITATION, WARRANTIES THAT THE SOFTWARE IS FREE OF DEFECTS,
 *  MERCHANTABLE, FIT FOR A PARTICULAR PURPOSE, OR NON-INFRINGING.
 *  See the License for the specific provisions governing your rights and
 *  obligations concerning the Software.
 * 
 *   The Initial Developer of the Original Code is: Sun Microsystems, Inc.
 * 
 *   Copyright: 2001 by Sun Microsystems, Inc.
 * 
 *   All Rights Reserved.
 * 
 ************************************************************************/
/*___INFO__MARK_END__*/
#define DEBUG

#include "rmon_h.h"
#include "rmon_def.h"
#include "rmon_err.h"
#include "rmon_rmon.h"
#include "rmon_message_list.h"

message_list_type *message_list = NULL;

void rmon_print_ml(
message_list_type *ml 
) {

#undef FUNC
#define FUNC "rmon_print_ml"

   DENTER;

   if (!ml)
      DPRINTF(("message_list = NULL !\n"));

   DPRINTF(("   pid level data\n"));
   while (ml) {
      DPRINTF(("%6d   %3d %s\n",
               ml->pid, ml->level, ml->data));
      ml = ml->next;
   }

   DEXIT;
}                               /* print_ml */

int rmon_delete_ml(
message_list_type **mlp 
) {
   message_list_type *ml;

#undef FUNC
#define FUNC "rmon_delete_ml"
   DENTER;

   if (!mlp) {
      DPRINTF(("invalid message list\n"));
      DEXIT;
      return 0;
   }

   while ((ml = *mlp)) {
      *mlp = ml->next;
      free(ml);
   }

   DEXIT;
   return 1;
}                               /* delete_ml */

#ifndef __MSG_QSTAT_FILTER_H
#define __MSG_QSTAT_FILTER_H
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

void qstat_filter_add_core_attributes(void);
void qstat_filter_add_ext_attributes(void);
void qstat_filter_add_pri_attributes(void);
void qstat_filter_add_urg_attributes(void);
void qstat_filter_add_l_attributes(void);
void qstat_filter_add_q_attributes(void);
void qstat_filter_add_r_attributes(void);
void qstat_filter_add_xml_attributes(void);
void qstat_filter_add_t_attributes(void);

lEnumeration *qstat_get_JB_Type_filter(void);
lCondition *qstat_get_JB_Type_selection(lList *user_list, u_long32 show);

#endif /* __MSG_QSTAT_FILTER_H */

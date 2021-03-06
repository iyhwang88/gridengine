<%
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
%>
/*
 *  Generated from java_event_pkinfo.jsp
 *  !!! DO NOT EDIT THIS FILE !!!
 */
<%

   class PKField {
       private String name;
       private String type;
       private String key;
   }
   
   java.util.Map<String,PKField> pkMap = new java.util.HashMap<String,PKField>();
   
   int pkNumIndex = 1;
   int pkStrIndex = 1;
   
   for(int i = 0; i < cullObj.getPrimaryKeyCount(); i++) {
      attr = cullObj.getPrimaryKeyAttr(i);
      
      PKField field = new PKField();
      field.name = jh.getAttrName(attr);
      if( field.name.endsWith("List") ) {          
         field.name  = field.name.substring(0, field.name.length() - 4 );
      }
      field.type = jh.getFullClassName(attr.getType());
      if(field.type.equals(String.class.getName())) {
          if(pkStrIndex >= 2) {
              throw new IllegalStateException("cull type " + cullObj.getName() + " has more then two string primary key fields");
          }
          field.key = "strKey" + pkStrIndex;
          pkStrIndex++;
      } else {
          if(pkNumIndex >= 2) {
              throw new IllegalStateException("cull type " + cullObj.getName() + " has more then two numeric primary key fields");
          }
          field.key = "numKey" + pkNumIndex;
          pkNumIndex++;
      }
      pkMap.put(field.name, field);
   }
         
   if(cullObj.getName().equals("JAT_Type")) {
       PKField taskNumber = (PKField)pkMap.get("taskNumber");
       taskNumber.key = "numKey2";
       
       PKField jobid = new PKField();
       jobid.name = "jobId";
       jobid.type = "int";
       jobid.key = "numKey1";
       pkMap.put(jobid.name, jobid);
   }
   
   if (cullObj.getName().equals("PET_Type")) {
       PKField jobid = new PKField();
       jobid.name = "jobId";
       jobid.type = "int";
       jobid.key = "numKey1";
       pkMap.put(jobid.name, jobid);
       
       PKField taskNumber = new PKField();
       taskNumber.name = "taskNumber";
       taskNumber.type = "int";
       taskNumber.key  = "numKey2";
       pkMap.put(taskNumber.name, taskNumber);
   }

   for (PKField field : pkMap.values()) {
%>   private <%=field.type%> m_<%=field.name%>;
<%         
   } 
%>

  /**
   *   Set the primary key info of the <%=name%>.
   *
   *   This method is not indented for public usage. It is called from the
   *   native code to set the primary key info of cull event.
   * 
   *   @param numKey1   first numerical key
   *   @param numKey2   second numerical key
   *   @param strKey1   fist string key
   *   @param strKey2   second string key
   */
  public void setPKInfo(int numKey1, int numKey2, String strKey1, String strKey2) {
<%
    for (PKField field : pkMap.values()) {
%>
        m_<%=field.name%> = <%=field.key%>;
<%
    }
%>
   }
   
<%
    // Accessor for the primary key information
   for (PKField field : pkMap.values()) {
       String gsmName = Character.toUpperCase(field.name.charAt(0)) + field.name.substring(1);
%>     
   /**
    *   Get the <%=field.name%> of the <%=name%>
    *
    *   @return the <%=field.name%> of the <%=name%>
    */
    public <%=field.type%> get<%=gsmName%>() {
       return m_<%=field.name%>;   
    }
<%       
    }
%>   

// using iTextSharp.text.html.simpleparser;
// using iTextSharp.text.pdf;
// using System;
// using System.Linq;
// using System.Collections.Generic;
// using System.Data;
// using System.IO;
// using System.Net;
// using System.Text;
// using System.Web;
// using System.Web.UI;
// using HIMS.BLL;
// using HIMS.BLL.ErrorLog;
// using System.Data.SqlClient;
// using System.Configuration;
// using System.Text.RegularExpressions;
// using System.Net.Mail;
// using System.Web.Hosting;
// using Newtonsoft.Json.Linq;
// using Newtonsoft.Json;
// using RestSharp.Deserializers;
// using RestSharp.Serializers;
// using RestSharp;
// using System.Web.Script.Serialization;
// namespace HIMS.BLL.Class
// {
// public class SMS
// {
//   Dictionary<string, object> dictionary = new Dictionary<string, object>();
//   CommanClass cs = new CommanClass();
//   public void SendSMS(string id, string Mode, string unitId, string orgGroup, string PatientType)
//   {
//     string msg = string.Empty; string msg1 = string.Empty;
//     dictionary.Clear();
//     try
//     {
//       if (PatientType == "old")
//       {
//         //string tempid = "1007162011462437861";
//         string dlt_template_id = "1007162572745563377";
//         if (Mode == "APPOINTMENT_REGISTERED_PATIENT")
//         {
//
//           dictionary.Add("@modeId", id);
//           dictionary.Add("@mode", "APPOINTMENT_REGISTERED_PATIENT");
//           DataTable dt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//           if (dt.Rows.Count > 0)
//           {
//
//
//
//
//
//             #region appointment
//             List<Component> lst = new List<Component>();
//   List<Parameter> lstprm = new List<Parameter>();
//   Parameter patient_name = new Parameter();
//   patient_name.text = dt.Rows[0]["PatientName"].ToString();
//   patient_name.type = "text";
//   lstprm.Add(patient_name);
//
//   Parameter dr_name = new Parameter();
//   dr_name.text = dt.Rows[0]["Consultant_Name"].ToString();
//   dr_name.type = "text";
//   lstprm.Add(dr_name);
//
//   Parameter appt_date = new Parameter();
//   appt_date.text = dt.Rows[0]["App_date"].ToString();
//   appt_date.type = "text";
//   lstprm.Add(appt_date);
//
//   Parameter before_time = new Parameter();
//   before_time.text = "15";
//   before_time.type = "text";
//   lstprm.Add(before_time);
//
//   Parameter clinic_name = new Parameter();
//   clinic_name.text = "Isha Netralaya";
//   clinic_name.type = "text";
//   lstprm.Add(clinic_name);
//
//
//   Parameter ADDRESS = new Parameter();
//   //    ADDRESS.text = "Radhakrishna Sankul, Karnik Road, Rambaug, Landmark: Opposite Holycross Hospitals, Thane-421301";
//   ADDRESS.text = dt.Rows[0]["full_Address"].ToString();
//
//   ADDRESS.type = "text";
//   lstprm.Add(ADDRESS);
//
//
//   Parameter branch_geo = new Parameter();
//   branch_geo.text = "https://maps.app.goo.gl/72NWDfcfVde8ergZ6";
//   branch_geo.type = "text";
//   lstprm.Add(branch_geo);
//
//   Parameter HELPLINE_NO = new Parameter();
//   HELPLINE_NO.text = "02516760600";
//   HELPLINE_NO.type = "text";
//   lstprm.Add(HELPLINE_NO);
//
//   Component cmpobj = new Component();
//   cmpobj.type = "body";
//   cmpobj.parameters = lstprm;
//
//   lst.Add(cmpobj);
//
//
//
//   var root = new Root
//
//   {
//   to = "+91" + dt.Rows[0]["MobileNumber"],
//   type = "template",
//   messaging_product = "whatsapp",
//   template = new Template
//   {
//
//   language = new Language
//   {
//   policy = "deterministic",
//   code = "en",
//   },
//   name = "doctor_appointment",
//
//   components = lst
//
//
//   }
//   };
//
//   int MessageId2 = call_api(root);
//   #endregion
//
//
//
//   msg = "doctor_appointment";
//   //msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + "-" + dt.Rows[0]["patient_ID"].ToString() + " your appointment is confirmed with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + "-" + dt.Rows[0]["OrgUnitName"].ToString() + ".Please call " + dt.Rows[0]["RegPhone1"].ToString() + "/" + dt.Rows[0]["RegPhone2"].ToString() + "For Self Registration Click on This Url" + ' ' + "\n" + "http://ishaksc.rxhis.com/Login/CentreDashBoard.aspx"; ;
//   //string MessageId = CallAPI(dt.Rows[0]["MobileNumber"].ToString(), msg);
//   //     msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + " your appointment is confirmed with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + ".isha netralaya";
//   //   string MessageId = CallAPINEW(dt.Rows[0]["mobile_no"].ToString(), msg, dlt_template_id);
//   if (MessageId2 != 0)
//   {
//   SMSLOG(dt.Rows[0]["patient_ID"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["MobileNumber"].ToString(), msg, unitId, orgGroup, 0, "WA");
//   }
//     }
//
//     }
//     if (Mode == "APPOINTMENT_RESCHEDULING")
//     {
//
//     dictionary.Add("@modeId", id);
//     dictionary.Add("@mode", "APPOINTMENT_RESCHEDULING");
//     DataTable dt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//     if (dt.Rows.Count > 0)
//     {
//     msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + "-" + dt.Rows[0]["patient_ID"].ToString() + " your appointment is rescheduled with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + "-" + dt.Rows[0]["OrgUnitName"].ToString() + ".Apologies for the inconvenience.Please call our Helpline No. " + dt.Rows[0]["RegPhone1"].ToString() + "/" + dt.Rows[0]["RegPhone2"].ToString() + " for fixing the appointment";
//     string MessageId = CallAPI(dt.Rows[0]["MobileNumber"].ToString(), msg);
//     if (MessageId != "0")
//     {
//     SMSLOG(dt.Rows[0]["patient_ID"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["MobileNumber"].ToString(), msg, unitId, orgGroup, 3, MessageId);
//     }
//     }
//
//     }
//     }
//     if (PatientType == "New")
//     {
//
//     if (Mode == "APPOINTMENT_REGISTERED_PATIENT")
//     {
//     string dlt_template_id = "1007162572745563377";
//     dictionary.Add("@modeId", id);
//     dictionary.Add("@mode", "APPOINTMENT_UNREGISTERED_PATIENT");
//     DataTable dt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//     if (dt.Rows.Count > 0)
//     {
//
//
//
//
//
//
//     #region appointment
//     List<Component> lst = new List<Component>();
//     List<Parameter> lstprm = new List<Parameter>();
//     Parameter patient_name = new Parameter();
//     patient_name.text = dt.Rows[0]["PatientName"].ToString();
//     patient_name.type = "text";
//     lstprm.Add(patient_name);
//
//     Parameter dr_name = new Parameter();
//     dr_name.text = dt.Rows[0]["Consultant_Name"].ToString();
//     dr_name.type = "text";
//     lstprm.Add(dr_name);
//
//     Parameter appt_date = new Parameter();
//     appt_date.text = dt.Rows[0]["App_date"].ToString();
//     appt_date.type = "text";
//     lstprm.Add(appt_date);
//
//     Parameter before_time = new Parameter();
//     before_time.text = "15";
//     before_time.type = "text";
//     lstprm.Add(before_time);
//
//     Parameter clinic_name = new Parameter();
//     clinic_name.text = "Isha Netralaya";
//     clinic_name.type = "text";
//     lstprm.Add(clinic_name);
//
//
//     Parameter ADDRESS = new Parameter();
//     //    ADDRESS.text = "Radhakrishna Sankul, Karnik Road, Rambaug, Landmark: Opposite Holycross Hospitals, Thane-421301";
//     ADDRESS.text = dt.Rows[0]["full_Address"].ToString();
//     ADDRESS.type = "text";
//     lstprm.Add(ADDRESS);
//
//
//     Parameter branch_geo = new Parameter();
//     branch_geo.text = "https://maps.app.goo.gl/72NWDfcfVde8ergZ6";
//     branch_geo.type = "text";
//     lstprm.Add(branch_geo);
//
//     Parameter HELPLINE_NO = new Parameter();
//     HELPLINE_NO.text = "02516760600";
//     HELPLINE_NO.type = "text";
//     lstprm.Add(HELPLINE_NO);
//
//     Component cmpobj = new Component();
//     cmpobj.type = "body";
//     cmpobj.parameters = lstprm;
//
//     lst.Add(cmpobj);
//
//
//
//     var root = new Root
//
//     {
//     to = "+91" + dt.Rows[0]["mobile_no"],
//     type = "template",
//     messaging_product = "whatsapp",
//     template = new Template
//     {
//
//     language = new Language
//     {
//     policy = "deterministic",
//     code = "en",
//     },
//     name = "doctor_appointment",
//
//     components = lst
//
//
//     }
//     };
//
//     int MessageId2 = call_api(root);
//     #endregion
//
//
//
//
//
//
//
//
//
//     // msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + "-" + dt.Rows[0]["patient_ID"].ToString() + " your appointment is confirmed with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + "-" + dt.Rows[0]["OrgUnitName"].ToString() + ".Please call " + dt.Rows[0]["RegPhone1"].ToString() + "/" + dt.Rows[0]["RegPhone2"].ToString() + "For Self Registration Click on This Url"+' '+"\n"+ "http://ishaksc.rxhis.com/Login/CentreDashBoard.aspx";
//     //msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + " your appointment is confirmed with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + ".isha netralaya";
//     //string MessageId = CallAPINEW(dt.Rows[0]["mobile_no"].ToString(), msg, dlt_template_id);
//     msg = "doctor_appointment";
//
//     if (MessageId2 != 0)
//     {
//     // SMSLOG(dt.Rows[0]["patient_ID"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["mobile_no"].ToString(), msg, unitId, orgGroup, "2", MessageId);
//     SMSLOG(dt.Rows[0]["patient_ID"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["mobile_no"].ToString(), msg, unitId, orgGroup, 0, "WA");
//
//     }
//     }
//
//     }
//
//
//     if (Mode == "APPOINTMENT_RESCHEDULING")
//     {
//     string dlt_template_id = "1007162572788293154";
//     dictionary.Add("@modeId", id);
//     dictionary.Add("@mode", "APPOINTMENT_UN_RESCHEDULING");
//     DataTable dt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//     if (dt.Rows.Count > 0)
//     {
//     //msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + "-" + dt.Rows[0]["patient_ID"].ToString() + " your appointment is rescheduled with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + "-" + dt.Rows[0]["OrgUnitName"].ToString() + ".Apologies for the inconvenience.Please call our Helpline No. " + dt.Rows[0]["RegPhone1"].ToString() + "/" + dt.Rows[0]["RegPhone2"].ToString() + " for fixing the appointment";
//     msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + " your appointment is rescheduled with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + ".isha netralaya";
//
//     string MessageId = CallAPINEW(dt.Rows[0]["mobile_no"].ToString(), msg, dlt_template_id);
//     if (MessageId != "0")
//     {
//     SMSLOG(dt.Rows[0]["patient_ID"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["mobile_no"].ToString(), msg, unitId, orgGroup, 3, MessageId);
//     }
//     }
//
//     }
//
//     }
//
//     }
//     catch (Exception ex)
//     {
//
//
//     }
//
//
//   }
//   public void RegisterPatient(string PatientId, string RefferedBy)
//   {
//     string msg = string.Empty; string msg1 = string.Empty;
//     dictionary.Add("@modeId", PatientId);
//     dictionary.Add("@mode", "REGISTERED_NEW_PATIENT");
//     DataTable dt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//     if (dt.Rows.Count > 0)
//     {
//       msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + ", Welcome to " + dt.Rows[0]["HospitalName"].ToString() + "-" + dt.Rows[0]["OrgUnitName"].ToString() + ".Your MRD No. is " + dt.Rows[0]["PatientCode"].ToString() + ".share your feedback/suggestions /complaint on " + dt.Rows[0]["RegPhone1"].ToString() + "/" + dt.Rows[0]["RegPhone2"].ToString() + " email - admin@ishanetralaya.com";
//       string MessageId = CallAPI(dt.Rows[0]["MobileNumber"].ToString(), msg);
//
//
//
//       #region header part of json start
//       List<Component> lst1 = new List<Component>();
//   List<Parameter> lstprm1 = new List<Parameter>();
//   image img = new image();
//
//   img.link = "https://easysolution.in/easysolution_aios/isha_logo.jpg";
//
//   Parameter headerdetails = new Parameter();
//   headerdetails.image = img;
//   headerdetails.type = "image";
//   lstprm1.Add(headerdetails);
//
//
//   Component cmpobj1 = new Component();
//   cmpobj1.type = "header";
//   cmpobj1.parameters = lstprm1;
//
//
//   #endregion
//
//
//
//   #region REgister patient whatsapp message
//   List<Component> lst = new List<Component>();
//   List<Parameter> lstprm = new List<Parameter>();
//
//   Parameter patient_name = new Parameter();
//   patient_name.text = dt.Rows[0]["PatientName"].ToString();
//   patient_name.type = "text";
//   lstprm.Add(patient_name);
//
//   Parameter PatientCode = new Parameter();
//   PatientCode.text = dt.Rows[0]["PatientCode"].ToString();
//   PatientCode.type = "text";
//   lstprm.Add(PatientCode);
//
//   Parameter clinic_name = new Parameter();
//   clinic_name.text = "Isha Netralaya";
//   clinic_name.type = "text";
//   lstprm.Add(clinic_name);
//
//
//   Parameter ADDRESS = new Parameter();
//   //   ADDRESS.text = "Radhakrishna Sankul, Karnik Road, Rambaug, Landmark: Opposite Holycross Hospitals, Thane-421301";
//   ADDRESS.text = dt.Rows[0]["full_Address"].ToString();
//   ADDRESS.type = "text";
//   lstprm.Add(ADDRESS);
//
//
//   Parameter branch_geo = new Parameter();
//   branch_geo.text = "https://maps.app.goo.gl/72NWDfcfVde8ergZ6";
//   branch_geo.type = "text";
//   lstprm.Add(branch_geo);
//
//   Parameter HELPLINE_NO = new Parameter();
//   HELPLINE_NO.text = "02516760600";
//   HELPLINE_NO.type = "text";
//   lstprm.Add(HELPLINE_NO);
//
//   Component cmpobj = new Component();
//   cmpobj.type = "body";
//   cmpobj.parameters = lstprm;
//
//   lst.Add(cmpobj);
//   lst.Add(cmpobj1);
//
//   var root = new Root
//
//   {
//   to = "+91" + dt.Rows[0]["MobileNumber"],
//   type = "template",
//   messaging_product = "whatsapp",
//   template = new Template
//   {
//
//   language = new Language
//   {
//   policy = "deterministic",
//   code = "en",
//   },
//   name = "new_registration",
//
//   components = lst
//
//
//   }
//   };
//
//   int MessageId2 = call_api(root);
//   #endregion
//
//
//
//
//
//
//   string temp_name = "new_registration";
//   if (MessageId2 != 0)
//   {
//   SMSLOG(dt.Rows[0]["PatientCode"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["MobileNumber"].ToString(), temp_name, dt.Rows[0]["UnitID"].ToString(), dt.Rows[0]["HospitalId"].ToString(), 0, "WA");
//   //msg1 = "Dear " + dt.Rows[0]["PatientName"].ToString() + "-" + dt.Rows[0]["PatientCode"].ToString() + ", THANK YOU for trusting your eyes with us. Please share your feedback at admin@ishanetralaya.com OR WhatsApp on 7738897514/15 and Get a Gift Coupon";
//   //string result = ScheduleSMS(dt.Rows[0]["MobileNumber"].ToString(), msg1, Convert.ToDateTime(dt.Rows[0]["ScheduleDate"]).ToString("yyyy/MM/dd") + "/" + Convert.ToDateTime(dt.Rows[0]["ScheduleDate"]).ToString("HH/mm"));
//   string result = ScheduleSMS(dt.Rows[0]["MobileNumber"].ToString(), msg1, Convert.ToDateTime(dt.Rows[0]["ScheduleDate"]).ToString("yyyy-MM-dd") + " " + Convert.ToDateTime(dt.Rows[0]["ScheduleDate"]).ToString("HH:mm:ss"));
//
//   if (result != "0")
//   {
//   SMSLOG(dt.Rows[0]["PatientCode"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["MobileNumber"].ToString(), msg1, dt.Rows[0]["UnitID"].ToString(), dt.Rows[0]["HospitalId"].ToString(), 9, result);
//
//   }
//   }
//   dictionary.Clear();
//   dictionary.Add("@mode", "Referred_Sms");
//   dictionary.Add("@Recipient", RefferedBy);
//   DataTable dttt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//   if (dttt.Rows.Count > 0)
//   {
//   msg = "Thank you for referring patient " + dt.Rows[0]["PatientName"].ToString() + " at Isha Netralaya. " + dt.Rows[0]["PatientName"].ToString() + " is given eye checkup reports.";
//   string MId = CallAPI(dttt.Rows[0]["Mobile"].ToString(), msg);
//   if (MId != "0")
//   {
//   SMSLOG(dttt.Rows[0]["ReferType"].ToString(), RefferedBy, dttt.Rows[0]["Mobile"].ToString(), msg, "1", "8", 13, MessageId);
//
//   }
//   }
//   }
//   }
//   public string CallAPI(string mob, string msg)
//   {
//     try
//     {
//       //string str = "http://luna.a2wi.co.in:7501/failsafe/HttpLink?aid=632528&pin=welcome21&mnumber=" + mob + "&signature=ISHAEY&message=" + msg;
//       string str = "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key= mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHANE&text=" + msg;
//       HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(str);
//       myReq.Timeout = 5000;
//       HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
//       StreamReader respStreamReader = new StreamReader(myResp.GetResponseStream());
//       string responseString = respStreamReader.ReadToEnd();
//       respStreamReader.Close();
//       myResp.Close();
//       if (responseString.Contains("Platform Accepted") == true)
//       {
//         string MessageID = GetMessageId(responseString, "Request accepted for Request ID=", " &");
//         return MessageID;
//       }
//       else
//       {
//         return "0";
//       }
//     }
//
//     catch (Exception ex)
//     {
//
//     return "0";
//     }
//
//
//   }
//   public string CallAPINEW(string mob, string msg, string dlt_template_id)
//   {
//     try
//     {
//       //string str = "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key= mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHANE&text=" + msg;
//       string str = "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key=mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHANE&dlt_entity_id=1001585870000017590&dlt_template_id=" + dlt_template_id + "&text=" + msg;
//       HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(str);
//       myReq.Timeout = 5000;
//       HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
//       StreamReader respStreamReader = new StreamReader(myResp.GetResponseStream());
//       string responseString = respStreamReader.ReadToEnd();
//       respStreamReader.Close();
//       myResp.Close();
//       if (responseString.Contains("Platform Accepted") == true)
//       {
//         string MessageID = GetMessageId(responseString, "Request accepted for Request ID=", " &");
//         return MessageID;
//       }
//       else
//       {
//         return "0";
//       }
//     }
//
//     catch (Exception ex)
//     {
//
//     return "0";
//     }
//
//
//   }
//
//
//   public static string GetMessageId(string strSource, string strStart, string strEnd)
//   {
//     int Start, End;
//     if (strSource.Contains(strStart) && strSource.Contains(strEnd))
//     {
//       Start = strSource.IndexOf(strStart, 0) + strStart.Length;
//       End = strSource.IndexOf(strEnd, Start);
//       return strSource.Substring(Start, End - Start);
//     }
//     else
//     {
//       return "";
//     }
//   }
//
//   public string GetDelivery(int MessageId)
//   {
//     try
//     {
//       string str = "";
//       //string str = "http://api.sms2support.com/getdelivery/sharpsight/sharpsight/" + MessageId;
//
//       HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(str);
//       myReq.Timeout = 5000;
//       HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
//       StreamReader respStreamReader = new StreamReader(myResp.GetResponseStream());
//       string responseString = respStreamReader.ReadToEnd();
//       respStreamReader.Close();
//       myResp.Close();
//       return responseString.Replace("\r\n", String.Empty);
//     }
//
//     catch (Exception ex)
//     {
//
//     return "PENDING";
//     }
//
//   }
//
//
//   public void Surgery_Rescheduling(string Consid, string unitId, string orgGroup)
//   {
//     string msg = string.Empty;
//
//     try
//     {
//       dictionary.Clear();
//       dictionary.Add("@modeId", Consid);
//       dictionary.Add("@mode", "Surgery_Rescheduling");
//       DataTable dt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//       if (dt.Rows.Count > 0)
//       {
//         msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + "-" + dt.Rows[0]["PatientCode"].ToString() + " Your Surgery is rescheduled for " + dt.Rows[0]["Surg_date"].ToString() + " with Operating Surgeon " + dt.Rows[0]["SurgeonName"].ToString() + ".Kindly Report at IPD Desk at " + dt.Rows[0]["ReportTime"].ToString() + " for necessary documentation. Please call " + dt.Rows[0]["RegPhone2"].ToString() + " for any further information at " + dt.Rows[0]["HospitalName"].ToString() + "-" + dt.Rows[0]["OrgUnitName"].ToString() + ".Warm Regards Team ​ISHA Netralaya.";
//
//         string MessageId = CallAPI(dt.Rows[0]["MobileNumber"].ToString(), msg);
//         if (MessageId != "0")
//         {
//           SMSLOG(dt.Rows[0]["PatientCode"].ToString(), dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["MobileNumber"].ToString(), msg, unitId, orgGroup, 6, MessageId);
//         }
//       }
//     }
//     catch (Exception ex)
//     {
//
//
//     }
//
//   }
//   public void SMSLOG(string Patient_Code, string to, string mobile, string message, string unitId, string OrgGroup, int TemplateId, string MessageId)
//   {
//     try
//     {
//       dictionary.Clear();
//       dictionary.Add("@Patient_Code", Patient_Code);
//       dictionary.Add("@Recipient", to);
//       dictionary.Add("@MobileNo", mobile);
//       dictionary.Add("@SmsText", message);
//       dictionary.Add("@unitid", unitId);
//       dictionary.Add("@HospitalId", OrgGroup);
//       dictionary.Add("@TemplateId", TemplateId);
//       dictionary.Add("@MessageId", MessageId);
//       dictionary.Add("@mode", "insert_log");
//       object c = execProcedureReturnValue(dictionary, "sp_SMS_Log");
//     }
//     catch (Exception ex)
//     {
//
//
//     }
//   }
//
//
//   public object execProcedureReturnValue(Dictionary<string, object> dictionary, string procName)
//   {
//     object result = 0;
//     SqlConnection cn = null;
//     SqlCommand cmd = null;
//     try
//     {
//       cn = cs.OpenConnection();
//       cn.ChangeDatabase(ConfigurationManager.AppSettings["Database_Name"]);
//       cmd = new SqlCommand(procName, cn);
//       cmd.CommandTimeout = 1000000;
//       cmd.CommandType = CommandType.StoredProcedure;
//
//       foreach (KeyValuePair<string, object> pairs in dictionary)
//       {
//         cmd.Parameters.AddWithValue(pairs.Key.Trim(), Convert.ToString(pairs.Value).Trim());
//       }
//
//       var returnParameter = cmd.Parameters.Add("@ReturnVal", SqlDbType.BigInt);
//       returnParameter.Direction = ParameterDirection.ReturnValue;
//
//
//       int res = cmd.ExecuteNonQuery();
//       result = returnParameter.Value;
//
//
//     }
//     catch { }
//     finally
//     {
//       cmd.Dispose();
//       cs.CloseConnection(cn);
//     }
//     return result;
//   }
//
//
//   public DataTable execProcedureReturnDt(Dictionary<string, object> dictionary, string procName)
//   {
//     DataTable data = null;
//     SqlConnection cn = null;
//     SqlCommand cmd = null;
//     try
//     {
//       cn = cs.OpenConnection();
//       cn.ChangeDatabase(ConfigurationManager.AppSettings["Database_Name"]);
//       SqlDataAdapter adapter;
//       cmd = new SqlCommand(procName, cn);
//       cmd.CommandType = CommandType.StoredProcedure;
//       cmd.CommandTimeout = 1000000;
//       foreach (KeyValuePair<string, object> pairs in dictionary)
//       {
//         cmd.Parameters.AddWithValue(pairs.Key, pairs.Value);
//       }
//       adapter = new SqlDataAdapter(cmd);
//
//       data = new DataTable();
//       adapter.Fill(data);
//       adapter.Dispose();
//
//     }
//     catch { }
//     finally
//     {
//       cmd.Dispose();
//       cs.CloseConnection(cn);
//     }
//     return data;
//
//   }
//
//   public string ScheduleSMS(string mob, string msg, string scheduleTime)
//   {
//      try
//      {
//          string str = "http://121.241.247.144:7501/failsafe/HttpLink?aid=571996&pin=es1&mnumber=" + mob + "&signature=ISHAEY&message=" + msg + "&scheTime=" + scheduleTime;
//
//          //string str = "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key= mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHAEY&text=" + msg;
//          HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(str);
//          myReq.Timeout = 5000;
//          HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
//          StreamReader respStreamReader = new StreamReader(myResp.GetResponseStream());
//          string responseString = respStreamReader.ReadToEnd();
//          respStreamReader.Close();
//          myResp.Close();
//          string MessageId = responseString.Substring(responseString.LastIndexOf("Request ID=") + "Request ID=".Length, responseString.IndexOf("~") - (responseString.LastIndexOf("Request ID=") + "Request ID=".Length));
//          if (MessageId.All(char.IsDigit) == true)
//          {
//              return MessageId.ToString();
//          }
//          else
//          {
//              return "0";
//          }
//
//      }
//
//      catch (Exception ex)
//      {
//
//          return "0";
//      }
//
//
//   }
//
//   public string ScheduleSMS(string mob, string msg, string scheduleTime)
//   {
//     try
//     {
//
//       string str = "https://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key= mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHANE&text=" + msg + "&sch_at=" + scheduleTime;
//       HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(str);
//       myReq.Timeout = 5000;
//       HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
//       StreamReader respStreamReader = new StreamReader(myResp.GetResponseStream());
//       string responseString = respStreamReader.ReadToEnd();
//       respStreamReader.Close();
//       myResp.Close();
//       if (responseString.Contains("Platform Accepted") == true)
//       {
//         string MessageID = GetMessageId(responseString, "Request accepted for Request ID=", "&");
//         return MessageID;
//       }
//       else
//       {
//         return "0";
//       }
//     }
//
//     catch (Exception ex)
//     {
//
//     return "0";
//     }
//
//
//   }
//
//   public int OTP_API(string mob, string msg)
//   {
//     try
//     {
//       string str = "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key= mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHANE&text=" + msg;
//
//       //string str = "http://japi.instaalerts.zone/httpapi/QueryStringReceiver?ver=1.0&key= mHjjbZhkavuion3c6YPtaA==&encrpt=0&dest=" + mob + "&send=ISHAEY&text=" + msg;
//       //string str = "http://api.sms2support.com/sendsms?uname=sharpsight&pwd=sharpsight&senderid=SHARPC&to=" + mob + "&msg=" + msg + "&route=T";
//       HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(str);
//       myReq.Timeout = 5000;
//       HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
//       StreamReader respStreamReader = new StreamReader(myResp.GetResponseStream());
//       string responseString = respStreamReader.ReadToEnd();
//       respStreamReader.Close();
//       myResp.Close();
//       if (Regex.Replace(responseString, @"\r\n?|\n", "").All(char.IsDigit) == true)
//       {
//         return Convert.ToInt32(responseString);
//       }
//       else
//       {
//         return 0;
//       }
//
//     }
//
//     catch (Exception ex)
//     {
//
//     return 0;
//     }
//
//
//   }
//
//   public void OnlineAppointmentCancel(string RowId)
//   {
//     string dlt_template_id = "1007162434584336799";
//     string msg = string.Empty;
//     dictionary.Add("@modeId", RowId);
//     dictionary.Add("@mode", "ONLINE_APP_CANCEL");
//     DataTable dt = cs.execProcedureReturnDt(dictionary, "sp_SMS_Log");
//     if (dt.Rows.Count > 0)
//     {
//       // msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + " Your appointment has been cancelled with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " due to " + dt.Rows[0]["Cancel_Reason"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + ".Apologies for the inconvenience. Please call our Helpline No." + dt.Rows[0]["RegPhone2"].ToString() + "  for any other information. Warm Regards Team ISHA NETRALAYA.";
//       msg = "Dear " + dt.Rows[0]["PatientName"].ToString() + " Your appointment has been cancelled with " + dt.Rows[0]["Consultant_Name"].ToString() + " at " + dt.Rows[0]["App_time"].ToString() + " on " + dt.Rows[0]["App_date"].ToString() + " at " + dt.Rows[0]["HospitalName"].ToString() + ".isha netralaya";
//       string MessageId = CallAPINEW(dt.Rows[0]["MobileNumber"].ToString(), msg, dlt_template_id);
//       if (Convert.ToInt64(MessageId) > 0)
//       {
//         SMSLOG("", dt.Rows[0]["PatientName"].ToString(), dt.Rows[0]["MobileNumber"].ToString(), msg, dt.Rows[0]["unitid"].ToString(), "", 15, MessageId);
//       }
//     }
//   }
//   public void Cancelofflineappointment(string rowid)
//   {
//     string dlt_template_id = "1007162572795294284";
//     string msg = string.Empty;
//     dictionary.Add("@app_id", rowid);
//     DataTable dt = cs.execProcedureReturnDt(dictionary, "usp_offine_aap_cancel");
//     if (dt.Rows.Count > 0)
//     {
//       // msg = "Dear " + dt.Rows[0]["patient_name"].ToString() + "" + dt.Rows[0]["patient_ID"].ToString() + " your appointment is cancelled with " + dt.Rows[0]["doctor_name"].ToString() + " at " + dt.Rows[0]["bookingtime"].ToString() + " on " + dt.Rows[0]["App_date_time"].ToString() + " at Arohi Eye Hospital, 105, Ground and First Floor, Aston Building, Near Lokhandwala Circle, Andheri West, Website : www.arohieye.in.To Reschedule, call  +91-9820111315.";
//       msg = "Dear " + dt.Rows[0]["patient_name"].ToString() + " your appointment is cancel with " + dt.Rows[0]["doctor_name"].ToString() + " at " + dt.Rows[0]["bookingtime"].ToString() + " on " + dt.Rows[0]["App_date_time"].ToString() + " at" + dt.Rows[0]["Address"].ToString() + ". isha netralaya";
//       //Dear {#var#} your appointment is  cancel with {#var#} at {#var#} on {#var#} at {#var#}. isha netralaya
//       string MessageId = CallAPINEW(dt.Rows[0]["MobileNumber"].ToString(), msg, dlt_template_id);
//       if (MessageId != "0")
//       {
//         SMSLOG("", dt.Rows[0]["patient_name"].ToString(), dt.Rows[0]["MobileNumber"].ToString(), msg, dt.Rows[0]["unitid"].ToString(), "", 15, MessageId);
//       }
//     }
//   }
//
//
//
//   private int call_api(Root root)
//   {
//     JsonSerializerSettings settings = new JsonSerializerSettings();
//     settings.NullValueHandling = NullValueHandling.Ignore;
//     var Makejson = JsonConvert.SerializeObject(root, settings);
//
//
//     string api = "b6322388-1866-40f0-b134-940e4f02e040";
//     var client = new RestClient("https://graph.facebook.com/101748549241251/messages");
//     client.Timeout = -1;
//     var request = new RestRequest(Method.POST);
//     request.AddHeader("Content-Type", "application/json");
//     request.AddHeader("Authorization", "Bearer EAAEwa5lU8kUBAAY3JPB6Lzf9OCRApVjYDpbMAgVrsXg0iDUWZC5wGXC4DK8vSmIzB0MkceIcZAKZCy347x0o4fZC8pCOiFJn4QFBswA44wBDZBE5ZAZBIhdpvULglxLzNtWdfenGl8ZB09I77IZBU01uYoGjnwpAPKU9VAbKEY0WYLBMERHsv4dVK");
//
//
//     request.AddParameter("application/json",
//         "" + Makejson + "", ParameterType.RequestBody);
//
//     var xml = request;
//     IRestResponse response = client.Execute(request);
//     Console.WriteLine(response.Content);
//     var json = response.Content;
//     var status = response.StatusCode;
//     if (status.ToString() == "OK")
//     {
//
//       return 1;
//     }
//     else
//       return 0;
//   }
//
//
//
//
// }
// }

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksForGeeks"),
        backgroundColor: Colors.green,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Alert Dialog Box"),
                  content: const Text("You have raised a Alert Dialog Box"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(14),
                        child: const Text("okay"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Show alert Dialog box"),
          ),

// RaidedButton is deprecated and should not be used
// Instead use ElevatedButton

          // child: RaisedButton(
          // onPressed: () {
          //	 showDialog(
          //	 context: context,
          //	 builder: (ctx) => AlertDialog(
          //		 title: const Text("Alert Dialog Box"),
          //		 content: const Text("You have raised a Alert Dialog Box"),
          //		 actions: <Widget>[

          // FlatButton is deprecated and should not be used
          // Instead use TextButton

          //		 FlatButton(
          //			 onPressed: () {
          //			 Navigator.of(ctx).pop();
          //			 },
          //			 child: const Text("okay"),
          //		 ),
          //		 ],
          //	 ),
          //	 );
          // },
          // child: const Text("Show alert Dialog box"),
          // ),
        ),
      ),
    );
  }
}

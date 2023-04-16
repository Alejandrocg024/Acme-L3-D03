<%--
- form.jsp
-
- Copyright (C) 2012-2023 Rafael Corchuelo.
-
- In keeping with the traditional purpose of furthering education and research, it is
- the policy of the copyright owner to permit non-commercial use and redistribution of
- this software. It has been tested carefully, but it is not guaranteed for any particular
- purposes.  The copyright owner does not offer any warranties or representations, nor do
- they accept any liabilities with respect to them.
--%>

<%@page language="java"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="acme" uri="http://www.the-acme-framework.org/"%>

<acme:form>
	<acme:input-textbox code="lecturer.course.form.label.code" path="code"/>	
	<acme:input-textbox code="lecturer.course.form.label.title" path="title"/>	
	<acme:input-textbox code="lecturer.course.form.label.abstract$" path="abstract$"/>	
	<acme:input-money code="lecturer.course.form.label.price" path="price"/>	
	<acme:input-url code="lecturer.course.form.label.furtherInformationLink" path="furtherInformationLink"/>
	<jstl:choose>	 
		<jstl:when test="${_command == 'show' && draftMode == false}">
			<acme:button code="lecturer.course.lectures" action="/lecturer/lecture/list?masterId=${id}"/>
			<acme:input-money code="lecturer.course.form.label.money" path="money" readonly="true"/>	
			<acme:input-textbox code="lecturer.course.form.label.courseType" path="nature" readonly="true"/>			
		</jstl:when>
		<jstl:when test="${acme:anyOf(_command, 'show|update|delete|publish') && draftMode == true && hasLectures}">
			<acme:input-money code="lecturer.course.form.label.money" path="money" readonly="true"/>	
			<acme:input-textbox code="lecturer.course.form.label.courseType" path="nature" readonly="true"/>
			<acme:button code="lecturer.course.lectures" action="/lecturer/lecture/list?masterId=${id}"/>
			<acme:submit code="lecturer.course.form.button.update" action="/lecturer/course/update"/>
			<acme:submit code="lecturer.course.form.button.delete" action="/lecturer/course/delete"/>
			<acme:submit code="lecturer.course.form.button.publish" action="/lecturer/course/publish"/>
		</jstl:when>
		<jstl:when test="${acme:anyOf(_command, 'show|update|delete|publish') && draftMode == true }">
			<acme:input-money code="lecturer.course.form.label.money" path="money" readonly="true"/>
			<acme:button code="lecturer.course.lectures" action="/lecturer/lecture/list?masterId=${id}"/>
			<acme:submit code="lecturer.course.form.button.update" action="/lecturer/course/update"/>
			<acme:submit code="lecturer.course.form.button.delete" action="/lecturer/course/delete"/>
			<acme:submit code="lecturer.course.form.button.publish" action="/lecturer/course/publish"/>
		</jstl:when>
		<jstl:when test="${_command == 'create'}">
			<acme:submit code="lecturer.course.form.button.create" action="/lecturer/course/create"/>
		</jstl:when>		
	</jstl:choose>
	
</acme:form>

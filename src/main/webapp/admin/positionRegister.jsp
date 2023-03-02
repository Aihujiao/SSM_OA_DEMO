<%@ page import="java.util.List" %>
<%@ page import="ctrl.dao.StationDao" %>
<%@ page import="model.Station" %><%--
  Created by IntelliJ IDEA.
  User: 40771
  Date: 2023/2/5
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../base.jsp"%>

<html>
<head>
    <title>添加工作职位</title>
    <link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet">
    <style>
        #editor—wrapper {
            border: 1px solid #ccc;
            z-index: 100; /* 按需定义 */
        }
        #toolbar-container { border-bottom: 1px solid #ccc; }
        #editor-container { height: 500px; }
    </style>
</head>
<body>
<h2>新增工作职位</h2>
    <form action="<%=contextPath%>/AdminServer" style="width: 60%">
        <input type="hidden" name="op" value="positionRegister">
        <p>职位名称：<input type="text" name="positionName" placeholder=""></p>
<%--        <p>职位介绍：--%>
<%--            <textarea name="positionIntro" id="positionIntro" cols="30" rows="10" placeholder="请输入该职位的简要描述"></textarea>--%>
<%--        </p>--%>

        <p>
            职位介绍：
            <div id="editor—wrapper">
                <div id="toolbar-container"><!-- 工具栏 --></div>
                <div id="editor-container" name="positionIntro"><!-- 编辑器 --></div>
            </div>
        </p>
        <button>添加职位</button>
    </form>
</body>
<script src="<%=request.getContextPath()%>/js/index.js"></script>
<script>
    const { createEditor, createToolbar } = window.wangEditor

    const editorConfig = {
        placeholder: '请输入职位简介...',
        onChange(editor) {
            const html = editor.getHtml()
            console.log('editor content', html)
            // 也可以同步到 <textarea>
        }
    }

    const editor = createEditor({
        selector: '#editor-container',
        html: '<p><br></p>',
        config: editorConfig,
        mode: 'default', // or 'simple'
    })

    const toolbarConfig = {}

    const toolbar = createToolbar({
        editor,
        selector: '#toolbar-container',
        config: toolbarConfig,
        mode: 'default', // or 'simple'
    })
</script>
</html>

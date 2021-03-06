<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("path", request.getContextPath());
    %>
    <script type="text/javascript" src="${path}/static/jquery-3.2.1/jquery-3.2.1.min.js"></script>
    <link href="${path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Modal员工添加的模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">EmpName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_Add_Input"
                                   placeholder="Tom">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_Add_Input"
                                   placeholder="tom@126.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_Add_Input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_Add_Input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->
<!-- Modal员工修改的模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">EmpName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email_Update_Input"
                                   placeholder="tom@126.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_Update_Input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_Update_Input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Department</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId" id="dept_Update_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!-- ------------------------------------------------------------------------------------------------------- -->
<!-- 搭建显示页面-->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>SSM-CRUD</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_Add_Modal_Btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-responsive" id="emps_table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_all"/></th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 显示分页信息-->
    <div class="row">
        <!--分页文字信息-->
        <div class="col-md-6" id="page_info_area">
        </div>
        <!--分页条信息-->
        <div class="col-md-6" id="page_nav_area">
        </div>
    </div>
</div>


<script type="text/javascript">
    $(function () {
        toPage(1);
    });

    var totalNum, currentPage;

    function toPage(pn) {
        $.ajax({
            url: "${path}/emp",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    }

    function build_emps_table(result) {
        //清空表格
        $("#emps_table tbody").empty();
        var emps = result.info.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkboxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit_id", item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("delete_id", item.empId);
            var btn = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkboxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btn)
                .appendTo("#emps_table tbody");
        });
    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第" + result.info.pageInfo.pageNum + "页,共" + result.info.pageInfo.pages + "页,共" + result.info.pageInfo.total + "条记录");
        totalNum = result.info.pageInfo.total;
        currentPage = result.info.pageInfo.pageNum;
    }

    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")));
        if (result.info.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加翻页事件
            firstPageLi.click(function () {
                toPage(1);
            });
            prePageLi.click(function () {
                toPage(result.info.pageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.info.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                toPage(result.info.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                toPage(result.info.pageInfo.pages);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.info.pageInfo.navigatepageNums, function (index, item) {
            var pageNumLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.info.pageInfo.pageNum == item) {
                pageNumLi.addClass("active");
            }
            pageNumLi.click(function () {
                toPage(item);
            })
            ul.append(pageNumLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var nav = $("<nav></nav>").append(ul);
        nav.appendTo("#page_nav_area");
    }

    <!-- ------------------------------------------------------------------------------------------------------- -->
    <!--新增模态框-->
    $("#emp_Add_Modal_Btn").click(function () {
        $("#empAddModal form")[0].reset();
        getDepts("#empAddModal select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop: "static"
        });
    });

    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url: "${path}/depts",
            type: "GET",
            success: function (result) {
                $.each(result.info.depts, function () {
                    var option = $("<option></option>").append(this.deptName).attr("value", this.deptId);
                    option.appendTo(ele);
                });
            }
        });
    }

    function validate_add_form() {
        //校验用户名
        var empName = $("#empName_Add_Input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            //alert("重新输入名字");
            show_validate_msg("#empName_Add_Input", "error", "名字有误");
            return false;
        } else {
            show_validate_msg("#empName_Add_Input", "success", "");
        }
        ;
        //校验邮箱
        var email = $("#email_Add_Input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            //alert("重新输入邮箱");
            show_validate_msg("#email_Add_Input", "error", "邮箱有误");
            return false;
        } else {
            show_validate_msg("#email_Add_Input", "success", "");
        }
        ;
        return true;
    }

    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    $("#empName_Add_Input").change(function () {
        var empName = this.value;
        $.ajax({
            url: "${path}/checkUser",
            data: "empName=" + empName,
            type: "POST",
            success: function (result) {

                if (result.code == 100) {
                    show_validate_msg("#empName_Add_Input", "success", "用户名可用");
                    $("#emp_save_btn").attr("ajax_validate", "success");
                } else {
                    show_validate_msg("#empName_Add_Input", "error", result.info.validate_msg);
                    $("#emp_save_btn").attr("ajax_validate", "error");
                }
            }
        });
    });

    $("#emp_save_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        if ($(this).attr("ajax_validate") == "error") {
            return false;
        }
        $.ajax({
            url: "${path}/emp",
            type: "POST",
            data: $("#empAddModal form").serialize(),
            success: function () {
                //alert(result.msg);
                //关闭模态框
                $("#empAddModal").modal('hide');
                //跳到最后一页
                toPage(totalNum);
            }
        });
    });

    //绑定修改事件的模态框
    $(document).on("click", ".edit_btn", function () {
        getDepts("#empUpdateModal select");
        getEmp($(this).attr("edit_id"));
        $("#emp_update_btn").attr("edit_id", $(this).attr("edit_id"));
        //弹出模态框
        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    });

    function getEmp(id) {
        $.ajax({
            url: "${path}/emp/" + id,
            type: "GET",
            success: function (result) {
                var empData = result.info.employee;
                $("#empName_update_static").text(empData.empName);
                $("#email_Update_Input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        });
    }


    $("#emp_update_btn").click(function () {
        //校验邮箱
        var email = $("#email_Update_Input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            //alert("重新输入邮箱");
            show_validate_msg("#email_Update_Input", "error", "邮箱有误");
            return false;
        } else {
            show_validate_msg("#email_Update_Input", "success", "");
        }

        $.ajax({
            url: "${path}/emp/" + $(this).attr("edit_id"),
            type: "POST",
            data: $("#empUpdateModal form").serialize() + "&_method=PUT",
            success: function () {
                $("#empUpdateModal").modal("hide");
                toPage(currentPage);
            }
        });
    });

    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("delete_id");
        if (confirm("确认删除" + empName + "吗？")) {
            $.ajax({
                url: "${path}/emp/" + empId,
                type: "DELETE",
                success: function () {
                    toPage(currentPage);
                }
            });
        }
    });

    $("#check_all").click(function () {
        $(".check_item").prop("checked", $(this).prop("checked"));
    });

    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked", flag);
    });

    $("#emp_delete_all_btn").click(function () {
        var empNames = "";
        var del_idStr = "";
        $.each($(".check_item:checked"), function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            del_idStr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        empNames = empNames.substring(0, empNames.length - 1);
        del_idStr = del_idStr.substring(0, del_idStr.length - 1);
        if (confirm("确定删除" + empNames + "吗？")) {

            $.ajax({
                url: "${path}/emp/" + del_idStr,
                type: "DELETE",
                success: function () {
                    toPage(currentPage);
                }
            });
        }
    });
</script>
</body>
</html>

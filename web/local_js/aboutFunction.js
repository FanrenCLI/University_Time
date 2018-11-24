//上传下载按钮样式
$('input[id=lefile]').change(function() {
    var str="";
    for(var i =0;i<document.getElementById("lefile").files.length;i++){
        str=str+ document.getElementById("lefile").files[i].name+'，';
    }
    $('#photoCover').val(str.substr(0,str.length-1));
});
//上传功能
$("#submitForm").click(function () {
    //注销地图点击事件
    flag=true;
    if(iconFeature1){vectorSource.removeFeature(iconFeature1)}
    if(!$('#pictureForm').data('bootstrapValidator').isValid()){
        alert("error");
    }else{
        var filelist=document.getElementById("lefile");
        var form=new FormData();
        form.append("name",$("#detailName").val());
        form.append("time",$("#time").val());
        form.append("location",$("#location").val());
        form.append("people",$("#people").val());
        form.append("awards",$("#awards").val());
        form.append("lon",$("#Lon").val());
        form.append("lat",$("#Lat").val());
        form.append("password",$("#password").val());
        for(var i=0;i<filelist.files.length;i++){
            form.append("files",filelist.files[i]);
        }
        $.ajax({
            url: "/upload",
            type: "POST",
            data: form,
            contentType: false,
            processData: false,
            success: function (data) {
                alert("ok");
                $.ajax({
                    url: "/update"
                });
                setTimeout("PageRefreash()",1500);
            },
            error:function () {
                alert("error");
            }
        });
    }


    //下面传输经纬度和地点名称；

});
//定位功能
$("#location_point").click(function () {
    flag=false;
})


function PageRefreash() {
    window.location.reload();
}
$("#refreshTable").click(function () {
    window.location.reload();
    
})
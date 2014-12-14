window.addEventListener("contents-ready", function(event){
    // random color
    var color=["#7c4dff", "#536dfe", "#009688", "#e51c23", "#ff5177", "#8bc34a", "#ff6e40", "#e040fb", "#9c27b0", "#6889ff", "#03a9f4"];
    var b=color[(parseInt(10*Math.random())%color.length)];
    document.getElementById("h2-title").style.setProperty("background-color", b);
    
    var data=event.detail.select;
    var title=document.createElement("title");
    title.innerText=data.Place;
    document.head.appendChild(title);

    document.getElementById("h2-title").innerText=data.Place;

    var img=document.createElement("img");
    img.id="img00";
    img.src=data.PicURL;
    img.width=window.innerWidth;
    
    document.getElementById("image").appendChild(img);
    document.getElementById("image").style.setProperty("width", "100%");
    document.getElementById("image").style.setProperty("margin", "0px auto");

    document.getElementById("description-frame").style.setProperty("width", "100%");
    document.getElementById("description").style.setProperty("margin", "15px 20px");
    document.getElementById("description").innerText=data.Information;

    window.onresize=function() {
        document.getElementById("img00").width=window.innerWidth;
        //document.getElementById("description").width=window.innerWidth;
    };
    
});

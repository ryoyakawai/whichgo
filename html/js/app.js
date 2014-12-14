window.addEventListener("contents-ready", function(event){
    var data=event.detail.select;
    console.log(data);
    var title=document.createElement("title");
    title.innerText=data.Place;
    document.head.appendChild(title);

    var img=document.createElement("img");
    img.src=data.PicURL;
    img.width="300";
    
    document.getElementById("image").appendChild(img);
    document.getElementById("image").style.setProperty("width", "300px");
    document.getElementById("image").style.setProperty("margin", "10px auto");

    document.getElementById("description").style.setProperty("margin", "5px");
    document.getElementById("description").innerText=data.Information;

});



window.onload = function(){ 
    document.getElementById("aside_button").onclick = function() {expand()};
   
    
    
};

document.addEventListener("DOMContentLoaded", function(event){
  // your code here
  for (var i = 0; i < 10; i++) {

  	var img=document.createElement("div");
    /*img.setAttribute("src", "images/defaultPL.png");*/

    if(i==2){
    	img.style.backgroundImage = "url('images/devils.jpg')";
    }else if(i==3){
    	img.style.backgroundImage = "url('images/pink-floyd-dark-side-of-the-moon-album-cover.jpg')";
    }else {
    	img.style.backgroundImage = "url('images/defaultPL.png')";
    }

    img.setAttribute("class", "records");
    var info=document.createElement("div");
    info.setAttribute("class", "info");
    var text=document.createElement("p");
    text.innerHTML = ("<h3>Izvajalec: Devil's gun</h3><h2>Naslov: Raising The Beast</h2>");

    info.appendChild(text);

    
    
    document.getElementById("main").appendChild(img);
    img.appendChild(info);

  }
	
});
 
function expand() {
	
	if(document.getElementById("aside").style.zIndex == "" || document.getElementById("aside").style.zIndex == "1"){
		
    	document.getElementById("aside").style.zIndex = "2";
	}else if(document.getElementById("aside").style.zIndex == "2"){
		
		document.getElementById("aside").style.zIndex = "1";
	}
}


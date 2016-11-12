

window.onload = function(){ 
    document.getElementById("aside_button").onclick = function() {expand()};
};

function expand() {
	
	if(document.getElementById("aside").style.zIndex == "" || document.getElementById("aside").style.zIndex == "1"){
		
    	document.getElementById("aside").style.zIndex = "2";
	}else if(document.getElementById("aside").style.zIndex == "2"){
		
		document.getElementById("aside").style.zIndex = "1";
	}
}
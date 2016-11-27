

document.addEventListener("DOMContentLoaded", function() {
    
        document.getElementById("search-submit").addEventListener("click", search);
        
    
});

function search(event) {
    if(document.documentElement.clientWidth > 1024){
        console.log("Screen size: " + document.documentElement.clientWidth);

    

        //var img=document.createElement("div");
        

        //img.setAttribute("class", "records");
        //var info=document.createElement("div");
        //info.setAttribute("class", "info");
        //var text=document.createElement("p");
        //text.innerHTML = ("<h3>Izvajalec: Devil's gun</h3><h2>Naslov: Raising The Beast</h2>");

        //info.appendChild(text);

        filename="records";
    
        var oReq = new XMLHttpRequest();
        oReq.addEventListener("load", searchHandlerJson);
        oReq.open("GET", filename+".json");
        oReq.responseType = "text";
        oReq.send();
        
        //document.getElementById("main").appendChild(img);
        //img.appendChild(info);

        
        
        event.preventDefault();
    }
}
 
function searchHandlerJson(event) {
    records = JSON.parse(this.responseText);
    

    document.getElementById("records").innerHTML = "";
    album=document.getElementById("album").value;
    artist=document.getElementById("artist").value;
    genres=document.getElementsByName("genre");
    media=document.getElementsByName("media");
    //console.log(genres.length);
    len=genres.length;
    var checkedGenres=[];
    var num=0;
    for(var i=0;i<len;i++){
        if(genres[i].checked){
            //console.log(genres[i].value);
            checkedGenres.push(genres[i]);
            num=num+1;
        }
    }

    var noResult=true;

    for(var record in records.records){
        var genreMatch=false;
        var albumMatch=false;
        var artistMatch=false;
        var mediaMatch=false;
        gens=records.records[record].genre;
        for(var j=0;j<gens.length;j++){
            for(var k=0;k<num; k++){
                console.log("ch: "+checkedGenres[k].value);
                    console.log(gens[j]);
                if(checkedGenres[k].value==gens[j]){
                    
                    genreMatch=true;
                }
            }
        }
 
        if(checkedGenres.length==0){
            genreMatch=true;
        }
        
        if(records.records[record].album==album || album==""){
            albumMatch=true;
        }

        if(records.records[record].artist==artist || artist==""){
            artistMatch=true;
        }

        if(!media[0].checked && !media[1].checked){
            mediaMatch=true;
        }

        if(media[0].checked && records.records[record].mediaType=="pl"){
            mediaMatch=true;
        }

        if(media[1].checked && records.records[record].mediaType=="cd"){
            mediaMatch=true;
        }

        //console.log("media: "+mediaMatch+ " \n artist: " +artistMatch);
        //console.log("album: "+albumMatch+ " \n genre: " +genreMatch);
        
        if(mediaMatch && genreMatch && albumMatch && artistMatch){
            noResult=false;
            var rec=document.createElement("div");
            rec.setAttribute("class", "record");
            if(records.records[record].jpgUrl == ""){
                if (records.records[record].genre.mediaType=="cd") {
                    rec.style.backgroundImage = "url('images/defaultCD.png')";
                }else{
                    rec.style.backgroundImage = "url('images/defaultPL.png')";
                }
                
            }else{
                rec.style.backgroundImage = "url('images/"+ records.records[record].jpgUrl +"')";
            }
            var info=document.createElement("div");
            info.setAttribute("class", "info");
            var back=document.createElement("div");
            back.setAttribute("class", "bckgrnd");
            var info_text=document.createElement("div");
            info_text.setAttribute("class", "info-text");
            info.appendChild(back);
            var naslov=document.createElement("h2");
            naslov.innerHTML="Naslov: "+records.records[record].album;
            var izvajalec=document.createElement("h3");
            izvajalec.innerHTML="Izvajalec: "+records.records[record].artist;
            var cena=document.createElement("h3");
            cena.innerHTML="Cena: "+records.records[record].price;
            cena.style.float="right";
            info_text.appendChild(cena);
            info_text.appendChild(izvajalec);
            info_text.appendChild(naslov);
            info.appendChild(info_text);
            rec.appendChild(info);
            document.getElementById("records").appendChild(rec);

        }

        
    }

    if(noResult){
        var res=document.createElement("h2");
        res.setAttribute("class", "no-result");
        res.innerHTML="Ni Rezultatov";
        document.getElementById("records").appendChild(res);
    }

}
//function expand() {
	
//	if(document.getElementById("aside").style.zIndex == "" || document.getElementById("aside").style.zIndex == "1"){
		
//    	document.getElementById("aside").style.zIndex = "2";
//	}else if(document.getElementById("aside").style.zIndex == "2"){
		
//		document.getElementById("aside").style.zIndex = "1";
//	}
//}


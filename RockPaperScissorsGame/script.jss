let start = document.querySelector(".button");
let tijera = document.querySelector(".tijera");
let roca = document.querySelector(".roca");
let papel = document.querySelector(".papel");
let choose = document.querySelector(".choose");
let pscore = document.querySelector("#pscore");
let cscore = document.querySelector("#cscore");
let compcho = document.querySelector("#compcho");
let what = document.querySelector("#what");
start.addEventListener("click", function() {
start.classList.add("fadeOut");
chau(start);
game();
})
let pascore = 0;
let cascore = 0;
 function chau(echar2) {
            setTimeout(function(){ 
                echar2.classList.add("out");
            }, 2000);
        }
 function game() {
    compcho.classList.add("fadeIn");
    choose.classList.add("fadeIn");
    tijera.classList.add("fadeIn");
    roca.classList.add("fadeIn");
    papel.classList.add("fadeIn");
    pscore.classList.add("fadeIn");
    cscore.classList.add("fadeIn");
    what.classList.add("fadeIn");
    document.getElementById("ola").classList.add("fadeIn");
    let round = 1;
    pscore.innerHTML = "YOUR SCORE: " + pascore;
    cscore.innerHTML = "COMPUTER SCORE: " + cascore;
 } 
  function play(playerSelection) {
    comp = computerPlay().toUpperCase();
    if(playerSelection == "ROCK") {
        switch (comp) {
            case ("ROCK"):
            document.getElementById("sape").src = "imgs/roca.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            document.getElementById("what").innerHTML = "DRAW!!!<br>Choose again!";
            break;
            case ("SCISSORS"):
            document.getElementById("sape").src = "imgs/tijera.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            what.innerHTML = "YOU WIN THIS ROUND! <br>Choose again!";
            pascore++;
            pscore.innerHTML = "YOUR SCORE: " + pascore;
            break;
            case ("PAPER"):
            document.getElementById("sape").src = "imgs/papel.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            document.getElementById("what").innerHTML = "YOU LOSE THIS ROUND! <br>Choose again!";
            cascore++;
            cscore.innerHTML = "COMPUTER SCORE: " + cascore;
            break;
    }
}
    if(playerSelection == "SCISSORS") {
        switch (comp) {
            case ("ROCK"):
            document.getElementById("sape").src = "imgs/roca.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            document.getElementById("what").innerHTML = "YOU LOSE THIS ROUND! <br>Choose again!";
            cascore++;
            cscore.innerHTML = "COMPUTER SCORE: " + cascore;
            break;
            case ("SCISSORS"):
            document.getElementById("sape").src = "imgs/tijera.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            document.getElementById("what").innerHTML = "DRAW!!!<br>Choose again!";
            break;
            case ("PAPER"):
            document.getElementById("sape").src = "imgs/papel.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            what.innerHTML = "YOU WIN THIS ROUND! <br>Choose again!";
            pascore++;
            pscore.innerHTML = "YOUR SCORE: " + pascore;
            break;           
    }
} 
    if(playerSelection == "PAPER") {
        switch (comp) {
            case ("ROCK"):
            document.getElementById("sape").src = "imgs/roca.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            what.innerHTML = "YOU WIN THIS ROUND! <br>Choose again!";
            pascore++;
            pscore.innerHTML = "YOUR SCORE: " + pascore;
            break;
            case ("SCISSORS"):
            document.getElementById("sape").src = "imgs/tijera.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            document.getElementById("what").innerHTML = "YOU LOSE THIS ROUND! <br>Choose again!";
            cascore++;
            cscore.innerHTML = "COMPUTER SCORE: " + cascore;
            break;
            case ("PAPER"):
            document.getElementById("sape").src = "imgs/papel.png";
            document.getElementById("what").style.color = "#" + (0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
            document.getElementById("what").innerHTML = "DRAW!!!<br>Choose again!";
            break;           
    }
    }
    if (pascore == 5) {
        document.getElementById("what").innerHTML = "YOU WON THE GAME!";
        roca.getElementsByTagName("img")[0].onclick = null;
        papel.getElementsByTagName("img")[0].onclick = null;
        tijera.getElementsByTagName("img")[0].onclick = null;
    } else if (cascore == 5) {
        document.getElementById("what").innerHTML = "YOU LOST THE GAME!";
        roca.getElementsByTagName("img")[0].onclick = null;
        papel.getElementsByTagName("img")[0].onclick = null;
        tijera.getElementsByTagName("img")[0].onclick = null;
    }
}
   
function computerPlay() {
	switch (Math.floor(Math.random() * 3)) {
		case (0):
		return "Rock";
		case (1):
		return "Paper";
		case (2):
		return "Scissors";
 	}
} 
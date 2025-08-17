let trains
let title
let id
let keyprice
let owned
let direction = 0
let showmaint = false
$(document).ready(function(){
  
    $(".container").hide();
    $("#container").hide();
    $("#container-landing").hide(); 
    $("#container-list").hide(); 
    $("#container-esc").hide(); 
    window.addEventListener('message', function(event){
        let data = event.data;
        trains = data.trains
        title = data.title
        keyprice = data.keyprice
        owned = data.owned
        showmaint = data.maint
        if (data.action == "show") {
            $(".container").show();
            $("#container").show();
            $("#container-landing").show(); 
            var company = document.getElementById("landingtitle");
            company.innerHTML = title;
            var trainkey = document.getElementById("trainkey");
            trainkey.innerHTML =  `Train Key $ ${keyprice}`;
            $("#container-esc").show(); 
        }

    });
});

function showimage(name) {
    for (const [ind, tab] of Object.entries(trains)) {
        if (ind == name){
            id = name
            var img = document.getElementById("theimage");
            img.style="display: show;";
            img.src=`img/${tab.img}.png`;
            var title = document.getElementById("trainname");
            title.style="display: show;";
            title.innerHTML = tab.name;
            var speed = document.getElementById("topspeed");
            speed.style="display: show;";
            speed.innerHTML = `Top Speed: ${tab.topspeed} MPH`;
            var coalconsumption = document.getElementById("coalconsumption");
            coalconsumption.style="display: show;";
            coalconsumption.innerHTML = `Coal Consumption: 1 per ${tab.coalconsumption} Seconds`;
            var coalcap = document.getElementById("coalcap");
            coalcap.style="display: show;";
            coalcap.innerHTML = `Coal Car Capacity: ${tab.coalcap}`;
            var price = document.getElementById("price");
            price.style="display: show;";
            price.innerHTML = `Price: $ ${tab.price}`;
            var buy = document.getElementById("buy");
            buy.style="display: show;";
        }
    }
}
function showimage2(name) {
    for (const [ind, tab] of Object.entries(owned)) {
        if (tab.id == name){
            id = name
            var img = document.getElementById("theimage");
            img.style="display: show;";
            img.src=`img/${tab.img}.png`;
            var title = document.getElementById("trainname");
            title.style="display: show;";
            title.innerHTML = tab.name;
            var speed = document.getElementById("topspeed");
            speed.style="display: show;";
            speed.innerHTML = `Top Speed: ${tab.speed} MPH`;
            var coalconsumption = document.getElementById("coalconsumption");
            coalconsumption.style="display: show;";
            coalconsumption.innerHTML = `Coal Consumption: 1 per ${tab.coalcon} Seconds`;
            var coalcap = document.getElementById("coalcap");
            coalcap.style="display: show;";
            coalcap.innerHTML = `Coal: ${tab.coal} / ${tab.coalcap}`;
            var price = document.getElementById("price");
            price.style="display: show;";
            if (showmaint == true) {
                price.innerHTML = `Maintenance: ${tab.maint} / 100`;
            }
            var spawn = document.getElementById("spawn");
            spawn.style="display: show;";
            var direct1 = document.getElementById("direct1");
            direct1.style="display: show;";
            direct1.innerHTML = "Direction: "+ direction;
        }
    }
}

function showimage3(name) {
    for (const [ind, tab] of Object.entries(owned)) {
        if (tab.id == name){
            id = name
            var img = document.getElementById("theimage");
            img.style="display: show;";
            img.src=`img/${tab.img}.png`;
            var title = document.getElementById("trainname");
            title.style="display: show;";
            title.innerHTML = tab.name;
            var speed = document.getElementById("topspeed");
            speed.style="display: show;";
            speed.innerHTML = `Top Speed: ${tab.speed} MPH`;
            var coalconsumption = document.getElementById("coalconsumption");
            coalconsumption.style="display: show;";
            coalconsumption.innerHTML = `Coal Consumption: 1 per ${tab.coalcon} Seconds`;
            var coalcap = document.getElementById("coalcap");
            coalcap.style="display: show;";
            coalcap.innerHTML = `Coal: ${tab.coal} / ${tab.coalcap}`;
            var price = document.getElementById("price");
            price.style="display: show;";
            if (showmaint == true) {
                price.innerHTML = `Maintenance: ${tab.maint} / 100`;
            }
            var spawn = document.getElementById("spawn2");
            spawn.style="display: show;";
            var direct1 = document.getElementById("direct1");
            direct1.style="display: show;";
            direct1.innerHTML = "Direction: "+ direction;
        }
    }
}

$("#viewselection").click(function (event) {
    $("#container-landing").hide(); 
    $('.grid-container').html('')
    for (const [ind, tab] of Object.entries(trains)) {
        $('.grid-container').append(
            `<button
            id = "viewselection2"
            onclick='showimage(${ind})'
            <div>
            <li>
            ${tab.name}
            </li>
            </div>
            </button>`
        );
    }
    var back = document.getElementById("back");
    back.style="display: show;";
    $("#container-list").show(); 
 });

 $("#ownedtrains").click(function (event) {
    $("#container-landing").hide(); 
    $('.grid-container').html('')
    for (const [ind, tab] of Object.entries(owned)) {
        $('.grid-container').append(
            `<button
            id = "viewselection2"
            onclick='showimage2(${tab.id})'
            <div>
            <li>
            ${tab.name}
            </li>
            </div>
            </button>`
        );
    }
    var back = document.getElementById("back");
    back.style="display: show;";
    $("#container-list").show(); 
 });

 $("#mission").click(function (event) {
    $("#container-landing").hide(); 
    $('.grid-container').html('')
    for (const [ind, tab] of Object.entries(owned)) {
        $('.grid-container').append(
            `<button
            id = "viewselection2"
            onclick='showimage3(${tab.id})'
            <div>
            <li>
            ${tab.name}
            </li>
            </div>
            </button>`
        );
    }
    var back = document.getElementById("back");
    back.style="display: show;";
    $("#container-list").show(); 
 });


function hideimage() {
    var img = document.getElementById("theimage");
    img.style="display: none;";
    var title = document.getElementById("trainname");
    title.style="display: none;";
    var speed = document.getElementById("topspeed");
    speed.style="display: none;";
    var coalconsumption = document.getElementById("coalconsumption");
    coalconsumption.style="display: none;";
    var coalcap = document.getElementById("coalcap");
    coalcap.style="display: none;";
    var price = document.getElementById("price");
    price.style="display: none;";
    var back = document.getElementById("back");
    back.style="display: none;";
    var buy = document.getElementById("buy");
    buy.style="display: none;";
    var spawn = document.getElementById("spawn");
    spawn.style="display: none;";
    var spawn2 = document.getElementById("spawn2");
    spawn2.style="display: none;";
    var direct1 = document.getElementById("direct1");
    direct1.style="display: none;";
}


$("#esc").click(function (event) {
    $(".container").hide();
    $("#container").hide();
    $("#container-landing").hide(); 
    $("#container-list").hide(); 
    $("#container-esc").hide(); 
    hideimage()
    trains = []
    $.post('http://syn_train/closeui', JSON.stringify({}));
 });

document.onkeyup = function (data) {
    if (data.which == 27) { // Escape key
        $(".container").hide();
        $("#container").hide();
        $("#container-landing").hide(); 
        $("#container-list").hide(); 
        $("#container-esc").hide(); 
        hideimage()
        $.post('http://syn_train/closeui', JSON.stringify({}));
    }
};

 $("#back").click(function (event) {
        $("#container-landing").show(); 
        $("#container-list").hide(); 
        hideimage()
 });

 $("#buy").click(function (event) {
    $(".container").hide();
    $("#container").hide();
    $("#container-landing").hide(); 
    $("#container-list").hide(); 
    $("#container-esc").hide(); 
    hideimage()
    for (const [ind, tab] of Object.entries(trains)) {
        if (ind == id){
            var hash = tab.hash
            var speed = tab.topspeed
            var coalcon = tab.coalconsumption
            var price = tab.price
            var coalcap = tab.coalcap
            var img = tab.img
            $.post('http://syn_train/buytrain', JSON.stringify({hash:hash,speed:speed,coalcon:coalcon,price:price,coalcap:coalcap,img:img}));
        }
    }
});

$("#direct1").click(function (event) {
    if (direction == 0) {
        direction = 1
    }else{
        direction = 0
    }
    direct1.innerHTML = "Direction: "+ direction;
});

$("#spawn").click(function (event) {
    $(".container").hide();
    $("#container").hide();
    $("#container-landing").hide(); 
    $("#container-list").hide(); 
    $("#container-esc").hide(); 
    hideimage()
    $.post('http://syn_train/spawntrain', JSON.stringify({id:id,direction:direction}));
});
$("#spawn2").click(function (event) {
    $(".container").hide();
    $("#container").hide();
    $("#container-landing").hide(); 
    $("#container-list").hide(); 
    $("#container-esc").hide(); 
    hideimage()
    $.post('http://syn_train/spawntrain', JSON.stringify({id:id,direction:direction}));
    $.post('http://syn_train/startmission', JSON.stringify({id:id}));
});

$("#trainkey").click(function (event) {
    $(".container").hide();
    $("#container").hide();
    $("#container-landing").hide(); 
    $("#container-list").hide(); 
    $("#container-esc").hide(); 
    hideimage()
    $.post('http://syn_train/buykey', JSON.stringify({}));
});
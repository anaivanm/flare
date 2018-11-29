$(".stop").hide();

$(".audioButton").on("click", function() {
  console.log("hey from audio");
  $(".audioButton").hide();
  $(".stop").show();
  $(".audio-play")[0].currentTime = 0;
  return $(".audio-play")[0].play();
});

$(".stop").on("click", function() {
  console.log("hey from audio");
  $(".stop").hide();
  $(".audioButton").show();
  $(".audio-play")[0].currentTime = 0;
  return $(".audio-play")[0].pause();
});



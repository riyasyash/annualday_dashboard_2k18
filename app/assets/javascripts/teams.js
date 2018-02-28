// progressbar.js@1.0.0 version is used
// Docs: http://progressbarjs.readthedocs.org/en/1.0.0/
$( document ).ready(function() {
  var circle = ['container_Red','container_Green','container_Blue','container_Yellow']
  console.log( "ready!" );
  for(i = 0; i < circle.length; i++) {
    container = document.getElementById(circle[i])
    color = document.getElementById(circle[i]).getAttribute('colour')
    pct = document.getElementById(circle[i]).getAttribute('pct')
    var bar = new ProgressBar.Circle(container, {
      color: color,
      trailColor: '#eee',
      trailWidth: 1,
      duration: 1400,
      easing: 'bounce',
      strokeWidth: 6,
      from: {color:color, a:0},
      to: {color: color, a:1},
      // Set default step function for all animate calls
      step: function(state, circle) {
        circle.path.setAttribute('stroke', state.color);
        var value = Math.round(circle.value() * 100);
        if (value === 0) {
          circle.setText('0%');
        } else {
          circle.setText(value+"%");
        }
      }

    });

    bar.animate(parseFloat(pct));
  }  // Number from 0.0 to 1.0
});

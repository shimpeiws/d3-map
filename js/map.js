(function() {
  var draw_map;

  $(function() {
    var my_draw_map;
    my_draw_map = draw_map();
    return this;
  });

  draw_map = function() {
    var g, height, map, width;
    g = {};
    width;
    height;
    width = 900;
    height = 650;
    map = d3.select('#map').append('svg').attr('width', width).attr('height', height).append('g');
    return d3.json("./data/hiroshima.json", function(json) {
      projection;
      path;
      var path, projection;
      projection = d3.geo.mercator().scale(45000).center(d3.geo.centroid(json)).translate([width / 2, height / 2]);
      path = d3.geo.path().projection(projection);
      map.selectAll('path').data(json.features).enter().append('path').attr('d', path).attr("fill", function(d) {
        return "hsl(0,0%,80%)";
      }).attr("stroke", "hsl(80,100%,0%)").on('mouseover', function(d) {
        return console.log("mouseover");
      }).on('click', function(d) {
        return console.log("clicked");
      });
      return this;
    });
  };

}).call(this);

$ ->
  my_draw_map = draw_map()
  return this

draw_map = ->
  g = {}
  width
  height
  width = 900
  height = 650

  # SVG要素の追加、append('g')でデータ格納用領域作成
  map = d3.select('#map').append('svg')
        .attr('width', width)
        .attr('height', height)
        .append('g')

  d3.json("./data/hiroshima.json", (json) ->
    projection
    path
     # 投影を処理する関数を用意する。データからSVGのPATHに変換するため。
    projection = d3.geo.mercator()
                  .scale(45000)
                  .center(d3.geo.centroid(json))  # データから中心点を計算
                  .translate([width / 2, height / 2])

    # pathジェネレータ関数
    path = d3.geo.path().projection(projection)

    map.selectAll('path')
          .data(json.features)
          .enter()
          .append('path')
          .attr('d', path)
          .attr("fill", (d) ->
            "hsl(0,0%,80%)")
          .attr("stroke","hsl(80,100%,0%)" )
          .on('mouseover', (d) ->
            console.log("mouseover"))
          .on('click', (d) ->
            console.log("clicked"))

    return this
  )




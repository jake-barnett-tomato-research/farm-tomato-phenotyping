# Introduction/Motivation

<div>
Wild tomatoes
<img src="attachment:wild_tomatoes_summer2020_Barnett.jpg" width="300"/>
</div>


```python

```

# Methods (both scientific and the coding approach)


```python

```


```python
#!conda install -y jupyter_dashboards -c conda-forge
#!jupyter nbextension enable jupyter_dashboards --py --sys-prefix
```


```python
import cartopy.crs as ccrs  # cartopy is good if you just want to work with seaborn
import geoviews as gv # geoviews is good if you like Holoviews
import geoviews.feature as gf  # gives you land, ocean, etc. to color features on your plot
from geoviews import dim
import pandas as pd
import numpy as np
import holoviews as hv
gv.extension('bokeh') # makes plots interactive, bokeh is part of holoviews family
```







<div class="logo-block">
<img src='data:image/png;base64,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
roTBs2RqAAAAAElFTkSuQmCC'
     style='height:25px; border-radius:12px; display: inline-block; float: left; vertical-align: middle'></img>


  <img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAAjCAYAAAAe2bNZAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAK6wAACusBgosNWgAAABx0RVh0U29mdHdhcmUAQWRvYmUgRmlyZXdvcmtzIENTNui8sowAAAf9SURBVFiFvZh7cFTVHcc/59y7793sJiFAwkvAYDRqFWwdraLVlj61diRYsDjqCFbFKrYo0CltlSq1tLaC2GprGIriGwqjFu10OlrGv8RiK/IICYECSWBDkt3s695zTv9IAtlHeOn0O7Mzu797z+/3Ob/z+p0VfBq9doNFljuABwAXw2PcvGHt6bgwxhz7Ls4YZNVXxxANLENwE2D1W9PAGmAhszZ0/X9gll5yCbHoOirLzmaQs0F6F8QMZq1v/8xgNm7DYwwjgXJLYL4witQ16+sv/U9HdDmV4WrKw6B06cZC/RMrM4MZ7xz61DAbtzEXmAvUAX4pMOVecg9/MFFu3j3Gz7gQBLygS2RGumBkL0cubiFRsR3LzVBV1UMk3IrW73PT9C2lYOwhQB4ClhX1AuKpjLcV27oEjyUpNUJCg1CvcejykWTCXyQgzic2HIIBjg3pS6+uRLKAhumZvD4U+tq0jTrgkVKQQtLekfTtxIPAkhTNF6G7kZm7aPp6M9myKVQEoaYaIhEQYvD781DML/RfBGNZXAl4irJiwBa07e/y7cQnBaJghIX6ENl2GR/fGCBoz6cm5qeyEqQA5ZYA5x5eeiV0Qph4gjFAUSwAr6QllQgcxS/Jm25Cr2Tmpsk03XI9NfI31FTZBEOgVOk51adqDBNPCNPSRlkiDXbBEwOU2WxH+I7itQZ62g56OjM33suq1YsZHVtGZSUI2QdyYgkgOthQNIF7BIGDnRAJgJSgj69cUx1gB8PkOGwL4E1gPrM27gIg7NlGKLQApc7BmEnAxP5g/rw4YqBrCDB5xHkw5rdR/1qTrN/hKNo6YUwVDNpFsnjYS8RbidBPcPXFP6R6yfExuOXmN4A3jv1+8ZUwgY9D2OWjUZE6lO88jDwHI8ZixGiMKSeYTBamCoDk6kDAb6y1OcH1a6KpD/fZesoFw5FlIXAVCIiH4PxrV+p2npVDToTBmtjY8t1swh2V61E9KqWiyuPEjM8dbfxuvfa49Zayf9R136Wr8mBSf/T7bNteA8zwaGEUbFpckWwq95n59dUIywKl2fbOIS5e8bWSu0tJ1a5redAYfqkdjesodFajcgaVNWhXo1C9SrkN3Usmv3UMJrc6/DDwkwEntkEJLe67tSLhvyzK8rHDQWleve5CGk4VZEB1r+5bg2E2si+Y0QatDK6jUVkX5eg2YYlp++ZM+rfMNYamAj8Y7MAVWFqaR1f/t2xzU4IHjybBtthzuiAASqv7jTF7jOqDMAakFHgDNsFyP+FhwZHBmH9F7cutIYkQCylYYv1AZSqsn1/+bX51OMMjPSl2nAnM7hnjOx2v53YgNWAzHM9Q/9l0lQWPSCBSyokAtOBC1Rj+w/1Xs+STDp4/E5g7Rs2zm2+oeVd7PUuHKDf6A4r5EsPT5K3gfCnBXNUYnvGzb+KcCczYYWOnLpy4eOXuG2oec0PBN8XQQAnpvS35AvAykr56rWhPBiV4MvtceGLxk5Mr6A1O8IfK7rl7xJ0r9kyumuP4fa0lMqTBLJIAJqEf1J3qE92lMBndlyfRD2YBghHC4hlny7ASqCeWo5zaoDdIWfnIefNGTb9fC73QDfhyBUCNOxrGPSUBfPem9us253YTV+3mcBbdkUYfzmHiLqZbYdIGHHON2ZlemXouaJUOO6TqtdHEQuXYY8Yt+EbDgmlS6RdzkaDTv2P9A3gICiq93sWhb5mc5wVhuU3Y7m5hOc3So7qFT3SLgOXHb/cyOfMn7xROegoC/PTcn3v8gbKPgDopJFk3R/uBPWQiwQ+2/GJevRMObLUzqe/saJjQUQTTftEVMW9tWxPgAocwcj9abNcZe7s+6t2R2xXZG7zyYLp8Q1PiRBBHym5bYuXi8Qt+/LvGu9f/5YDAxABsaRNPH6Xr4D4Sk87a897SOy9v/fKwjoF2eQel95yDESGEF6gEMwKhLwKus3wOVjTtes7qzgLdXTMnNCNoEpbcrtNuq6N7Xh/+eqcbj94xQkp7mdKpW5XbtbR8Z26kgMCAf2UU5YEovRUVRHbu2b3vK1UdDFkDCyMRQxbpdv8nhKAGIa7QaQedzT07fFPny53R738JoVYBdVrnsNx9XZ9v33UeGO+AA2MMUkgqQ5UcdDLZSFeVgONnXeHqSAC5Ew1BXwko0D1Zct3dT1duOjS3MzZnEUJtBuoQAq3SGOLR4ekjn9NC5nVOaYXf9lETrUkmOJy3pOz8OKIb2A1cWhJCCEzOxU2mUPror+2/L3yyM3pkM7jTjr1nBOgkGeyQ7erxpdJsMAS9wb2F9rzMxNY1K2PMU0WtZV82VU8Wp6vbKJVo9Lx/+4cydORdxCCQ/kDGTZCWsRpLu7VD7bfKqL8V2orKTp/PtzaXy42jr6TwAuisi+7JolUG4wY+8vyrISCMtRrLKWpvjAOqx/QGhp0rjRo5xD3x98CWQuOQN8qumRMmI7jKZPUEpzNVZsj4Zbaq1to5tZZsKIydLWojhIXrJnES79EaOzv3du2NytKuxzJKAA6wF8xqEE8s2jo/1wd/khslQGxd81Zg62Bbp31XBH+iETt7Y3ELA0iU6iGDlQ5mexe0VEx4a3x8V1AaYwFJgTiwaOsDmeK2J8nMUOqsnB1A+dcA04ucCYt0urkjmflk9iT2v30q/gZn5rQPvor4n9Ou634PeBzoznes/iot/7WnClKoM/+zCIjH5kwT8ChQjTHPIPTjFV3PpU/Hx+DM/A9U3IXI4SPCYAAAAABJRU5ErkJggg=='
       style='height:15px; border-radius:12px; display: inline-block; float: left'></img>





</div>



The data set includes wild tomato fruit phenotype measurements I made during summer 2020 for plants grown at the UMass Research Farm in South Deerfield, plus data from WorldClim on their climate of origin.


```python
data = pd.read_csv('data_233fruits_plus_climate_2021-05-08.csv')

# adjust worldclim temperature units so they make sense (divide by 10), 
# see https://groups.google.com/g/maxent/c/Bvm-QV7lhug

data['Temp_C'] = data['Temp'] / 10
data['Temp_warmest_q_C'] = data['Temp_warmest_q'] / 10
data['Temp_coldest_q_C'] = data['Temp_coldest_q'] / 10
data['Temp_seasonality_C'] = data['Temp_seasonality'] / 100
```


```python
fruit_variables = ['Diameter_mm', 'Length_mm', 'Diam_lgth_ratio','Fresh_weight_grams', 
                   'Seed_count', 'Tomato Pericarp Area Ratio_inside', 
                   'Average Luminosity_outside', 'Average Hue_outside', 'Average Chroma_outside',
                   'Glucose_rep_avg', 'Fructose_rep_avg', 'Sucrose_rep_avg',
                   'Total_sugars', 'Citric_avg', 'Malic_avg', 'Total_acids'
                  ]
climate_variables = ['Temp_C', 'Temp_seasonality_C', 
                     'Temp_warmest_q_C', 'Temp_coldest_q_C', 
                     'Prec', 'Prec_seasonality', 'Prec_wettest_q']


```


```python
acc_means = data.groupby('accession').mean()
acc_means.columns = [str(col) + '_mean' for col in acc_means.columns]

acc_stdev = data.groupby('accession').std()
acc_stdev.columns = [str(col) + '_stdev' for col in acc_stdev.columns]

acc_spec = pd.DataFrame(data.groupby('accession').first()['species_name'])
```


```python
data_by_acc = pd.merge(acc_means, acc_stdev, left_on='accession', right_on='accession')
data_by_acc = pd.merge(data_by_acc, acc_spec, left_on='accession', right_on='accession')
data_by_acc.rename(columns={'lon_mean': 'lon'}, inplace=True)
data_by_acc.rename(columns={'lat_mean': 'lat'}, inplace=True)
data_by_acc.head()
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Fruit_num_mean</th>
      <th>Phylo_pos_mean</th>
      <th>Diameter_mm_mean</th>
      <th>Length_mm_mean</th>
      <th>Diam_lgth_ratio_mean</th>
      <th>Fresh_weight_grams_mean</th>
      <th>Seed_count_mean</th>
      <th>Tomato Pericarp Area Ratio_inside_mean</th>
      <th>Average Luminosity_outside_mean</th>
      <th>Average Hue_outside_mean</th>
      <th>...</th>
      <th>Temp_coldest_q_stdev</th>
      <th>Prec_stdev</th>
      <th>Prec_seasonality_stdev</th>
      <th>Prec_wettest_q_stdev</th>
      <th>Prec_driest_q_stdev</th>
      <th>Temp_C_stdev</th>
      <th>Temp_warmest_q_C_stdev</th>
      <th>Temp_coldest_q_C_stdev</th>
      <th>Temp_seasonality_C_stdev</th>
      <th>species_name</th>
    </tr>
    <tr>
      <th>accession</th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>SA-05</th>
      <td>3.000000</td>
      <td>6.0</td>
      <td>13.998333</td>
      <td>11.858333</td>
      <td>1.181667</td>
      <td>1.204833</td>
      <td>26.000000</td>
      <td>0.266083</td>
      <td>98.226733</td>
      <td>102.639433</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>S. arcanum</td>
    </tr>
    <tr>
      <th>SA-09</th>
      <td>3.833333</td>
      <td>6.0</td>
      <td>20.670000</td>
      <td>17.746667</td>
      <td>1.163333</td>
      <td>4.067917</td>
      <td>114.333333</td>
      <td>0.334317</td>
      <td>100.234883</td>
      <td>87.034433</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>S. arcanum</td>
    </tr>
    <tr>
      <th>SA-18</th>
      <td>3.166667</td>
      <td>6.0</td>
      <td>14.375000</td>
      <td>13.871667</td>
      <td>1.036667</td>
      <td>1.595267</td>
      <td>57.000000</td>
      <td>0.219100</td>
      <td>76.504717</td>
      <td>107.755900</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>S. arcanum</td>
    </tr>
    <tr>
      <th>SC-19</th>
      <td>2.500000</td>
      <td>3.0</td>
      <td>13.203333</td>
      <td>12.530000</td>
      <td>1.053333</td>
      <td>1.181350</td>
      <td>37.833333</td>
      <td>0.384367</td>
      <td>73.910567</td>
      <td>68.853917</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>S. cheesmaniae</td>
    </tr>
    <tr>
      <th>SC-22</th>
      <td>3.500000</td>
      <td>3.0</td>
      <td>13.323333</td>
      <td>11.793333</td>
      <td>1.128333</td>
      <td>1.145600</td>
      <td>29.666667</td>
      <td>0.452267</td>
      <td>77.950900</td>
      <td>83.323933</td>
      <td>...</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>0.0</td>
      <td>S. cheesmaniae</td>
    </tr>
  </tbody>
</table>
<p>5 rows × 69 columns</p>
</div>



# Results


```python
def plotmap(species, variable):
    data = data_by_acc
    variable = str(variable) + '_mean'
    var2 = variable.replace('_mean', '_stdev')
    var_min = data.loc[:,data.columns== variable].min()
    var_max = data.loc[:,data.columns== variable].max()
    if species == 'All':
        points = gv.Points(data = data.loc[:, ('species_name', variable, var2, 'lon', 'lat')],
                       vdims = ['species_name', variable, var2,
                                hv.Dimension('lon', range=(-93, -67)), 
                                hv.Dimension('lat', range=(-23,3.7)),
                                #hv.Dimension(variable, range=(var_min, var_max))
                               ],
                       kdims = ['lon', 'lat']
                      )
    else:
        points = gv.Points(data = data.loc[data.species_name==species, ('species_name', variable, var2, 'lon', 'lat')],
                       vdims = ['species_name', variable, var2, 
                                hv.Dimension('lon', range=(-93, -67)), 
                                hv.Dimension('lat', range=(-23,3.7)),
                                #hv.Dimension(variable, range=(var_min, var_max))
                               ],
                       kdims = ['lon', 'lat']
                      )
    
    tiles = gv.tile_sources.EsriUSATopo

    if data[var2].mean()==0: # for climate variables, they don't have a stdev since there's one value per accession
        size_var = 7
    else: # for fruit variables, which have multiple measurements per accession
        # keep the range of point sizes somewhat consistent 
        # with a multiplication factor based on the average coefficient of variation for the given variable
        size_mult_factor = 8 / (data[var2].mean() / data[variable].mean())
        size_var = (dim(var2) / dim(variable)) * size_mult_factor
    
    return tiles * points.opts(
        color=variable, cmap='viridis', colorbar=True,
        size=size_var,
        tools=['hover'], global_extent=False, framewise=False, width=600, height=600)

```


```python
dmap1 = hv.DynamicMap(plotmap, kdims=['species','variable'])
dmap1.redim.values(species=['All'] + data.species_name.unique().tolist(),
                  variable=fruit_variables
                 )
```






<div id='19510'>





  <div class="bk-root" id="736609c4-5c65-489d-90ea-7c4b0a78895c" data-root-id="19510"></div>
</div>
<script type="application/javascript">(function(root) {
  function embed_document(root) {
    var docs_json = {"3987513e-71f6-4fc9-bd3b-4f65154f6b65":{"defs":[],"roots":{"references":[{"attributes":{"bottom_units":"screen","fill_alpha":0.5,"fill_color":"lightgrey","left_units":"screen","level":"overlay","line_alpha":1.0,"line_color":"black","line_dash":[4,4],"line_width":2,"right_units":"screen","syncable":false,"top_units":"screen"},"id":"19547","type":"BoxAnnotation"},{"attributes":{"level":"underlay","tile_source":{"id":"19575"}},"id":"19578","type":"TileRenderer"},{"attributes":{"match_aspect":true,"overlay":{"id":"19547"}},"id":"19521","type":"BoxZoomTool"},{"attributes":{"client_comm_id":"76dcd46060fe4285998ac9d6fb0c7949","comm_id":"f60e0826a9ed449bb3ef7cdd4461eb58","plot_id":"19510"},"id":"19697","type":"panel.models.comm_manager.CommManager"},{"attributes":{},"id":"19534","type":"LinearScale"},{"attributes":{"attribution":"&copy; <a href=\"http://downloads.esri.com/ArcGISOnline/docs/tou_summary.pdf\">Esri</a>, NatGeo, i-cubed","url":"https://server.arcgisonline.com/ArcGIS/rest/services/USA_Topo_Maps/MapServer/tile/{Z}/{Y}/{X}"},"id":"19575","type":"WMTSTileSource"},{"attributes":{"margin":[5,5,5,5],"name":"HSpacer118603","sizing_mode":"stretch_width"},"id":"19669","type":"Spacer"},{"attributes":{"data_source":{"id":"19583"},"glyph":{"id":"19586"},"hover_glyph":{"id":"19589"},"muted_glyph":{"id":"19590"},"nonselection_glyph":{"id":"19587"},"selection_glyph":{"id":"19588"},"view":{"id":"19592"}},"id":"19591","type":"GlyphRenderer"},{"attributes":{"children":[{"id":"19671"},{"id":"19672"},{"id":"19675"}],"margin":[0,0,0,0],"name":"Column118601"},"id":"19670","type":"Column"},{"attributes":{"axis_label":"Longitude","formatter":{"id":"19558"},"major_label_policy":{"id":"19561"},"ticker":{"id":"19557"}},"id":"19536","type":"LinearAxis"},{"attributes":{"fill_alpha":{"value":0.2},"fill_color":{"field":"color","transform":{"id":"19582"}},"line_alpha":{"value":0.2},"line_color":{"field":"color","transform":{"id":"19582"}},"size":{"field":"size"},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19590","type":"Scatter"},{"attributes":{},"id":"19545","type":"PanTool"},{"attributes":{},"id":"19602","type":"UnionRenderers"},{"attributes":{"callback":null,"formatters":{"$x":{"id":"19595"},"$y":{"id":"19596"}},"renderers":[{"id":"19591"}],"tags":["hv_created"],"tooltips":[["lon","$x{custom}"],["lat","$y{custom}"],["species_name","@{species_name}"],["Diameter_mm_mean","@{Diameter_mm_mean}"],["Diameter_mm_stdev","@{Diameter_mm_stdev}"]]},"id":"19524","type":"HoverTool"},{"attributes":{"end":412168.57585604145,"min_interval":5,"reset_end":412168.57585604145,"reset_start":-2632018.5166533417,"start":-2632018.5166533417,"tags":[[["Latitude","Latitude",null]]]},"id":"19519","type":"Range1d"},{"attributes":{},"id":"19584","type":"Selection"},{"attributes":{"zoom_on_axis":false},"id":"19520","type":"WheelZoomTool"},{"attributes":{"axis_label":"Latitude","formatter":{"id":"19560"},"major_label_policy":{"id":"19568"},"ticker":{"id":"19559"}},"id":"19540","type":"LinearAxis"},{"attributes":{"axis":{"id":"19540"},"dimension":1,"grid_line_color":null,"ticker":null},"id":"19543","type":"Grid"},{"attributes":{"code":"\n        var projections = Bokeh.require(\"core/util/projections\");\n        var x = special_vars.data_x\n        var y = special_vars.data_y\n        if (projections.wgs84_mercator.invert == null) {\n          var coords = projections.wgs84_mercator.inverse([x, y])\n        } else {\n          var coords = projections.wgs84_mercator.invert(x, y)\n        }\n        return \"\" + (coords[1]).toFixed(4)\n    "},"id":"19596","type":"CustomJSHover"},{"attributes":{},"id":"19546","type":"ResetTool"},{"attributes":{"fill_alpha":{"value":0.1},"fill_color":{"field":"color","transform":{"id":"19582"}},"line_alpha":{"value":0.1},"line_color":{"field":"color","transform":{"id":"19582"}},"size":{"field":"size"},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19587","type":"Scatter"},{"attributes":{"code":"\n        var projections = Bokeh.require(\"core/util/projections\");\n        var x = special_vars.data_x\n        var y = special_vars.data_y\n        if (projections.wgs84_mercator.invert == null) {\n          var coords = projections.wgs84_mercator.inverse([x, y])\n        } else {\n          var coords = projections.wgs84_mercator.invert(x, y)\n        }\n        return \"\" + (coords[0]).toFixed(4)\n    "},"id":"19595","type":"CustomJSHover"},{"attributes":{"children":[{"id":"19511"},{"id":"19527"},{"id":"19669"},{"id":"19670"}],"margin":[0,0,0,0],"name":"Row118591"},"id":"19510","type":"Row"},{"attributes":{"dimension":"lat"},"id":"19560","type":"MercatorTickFormatter"},{"attributes":{"source":{"id":"19583"}},"id":"19592","type":"CDSView"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"19582"}},"line_color":{"field":"color","transform":{"id":"19582"}},"size":{"field":"size"},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19586","type":"Scatter"},{"attributes":{"active_multi":null,"tools":[{"id":"19520"},{"id":"19521"},{"id":"19524"},{"id":"19545"},{"id":"19546"}]},"id":"19548","type":"Toolbar"},{"attributes":{"dimension":"lon"},"id":"19558","type":"MercatorTickFormatter"},{"attributes":{"end":-7458405.994468819,"min_interval":5,"reset_end":-7458405.994468819,"reset_start":-10352712.53245495,"start":-10352712.53245495,"tags":[[["Longitude","Longitude",null]]]},"id":"19518","type":"Range1d"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"19582"}},"line_color":{"field":"color","transform":{"id":"19582"}},"size":{"field":"size"},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19588","type":"Scatter"},{"attributes":{},"id":"19561","type":"AllLabels"},{"attributes":{"dimension":"lat","mantissas":[1,2,5]},"id":"19559","type":"MercatorTicker"},{"attributes":{},"id":"19593","type":"BasicTicker"},{"attributes":{"margin":[5,5,5,5],"name":"VSpacer118600","sizing_mode":"stretch_height"},"id":"19675","type":"Spacer"},{"attributes":{"axis":{"id":"19536"},"grid_line_color":null,"ticker":null},"id":"19539","type":"Grid"},{"attributes":{},"id":"19599","type":"NoOverlap"},{"attributes":{"dimension":"lon","mantissas":[1,2,5]},"id":"19557","type":"MercatorTicker"},{"attributes":{"margin":[20,20,5,20],"min_width":250,"options":["All","S. arcanum","S. cheesmaniae","S. chilense","S. chmielewskii","S. corneliomulleri","S. galapagense","S. habrochaites","S. huaylasense","nan","S. lycopersicum var. cerasiforme","S. neorickii","S. pennellii","S. pimpinellifolium","S. peruvianum"],"title":"species","value":"All","width":250},"id":"19673","type":"Select"},{"attributes":{"high":23.985,"low":8.63,"palette":["#440154","#440255","#440357","#450558","#45065a","#45085b","#46095c","#460b5e","#460c5f","#460e61","#470f62","#471163","#471265","#471466","#471567","#471669","#47186a","#48196b","#481a6c","#481c6e","#481d6f","#481e70","#482071","#482172","#482273","#482374","#472575","#472676","#472777","#472878","#472a79","#472b7a","#472c7b","#462d7c","#462f7c","#46307d","#46317e","#45327f","#45347f","#453580","#453681","#443781","#443982","#433a83","#433b83","#433c84","#423d84","#423e85","#424085","#414186","#414286","#404387","#404487","#3f4587","#3f4788","#3e4888","#3e4989","#3d4a89","#3d4b89","#3d4c89","#3c4d8a","#3c4e8a","#3b508a","#3b518a","#3a528b","#3a538b","#39548b","#39558b","#38568b","#38578c","#37588c","#37598c","#365a8c","#365b8c","#355c8c","#355d8c","#345e8d","#345f8d","#33608d","#33618d","#32628d","#32638d","#31648d","#31658d","#31668d","#30678d","#30688d","#2f698d","#2f6a8d","#2e6b8e","#2e6c8e","#2e6d8e","#2d6e8e","#2d6f8e","#2c708e","#2c718e","#2c728e","#2b738e","#2b748e","#2a758e","#2a768e","#2a778e","#29788e","#29798e","#287a8e","#287a8e","#287b8e","#277c8e","#277d8e","#277e8e","#267f8e","#26808e","#26818e","#25828e","#25838d","#24848d","#24858d","#24868d","#23878d","#23888d","#23898d","#22898d","#228a8d","#228b8d","#218c8d","#218d8c","#218e8c","#208f8c","#20908c","#20918c","#1f928c","#1f938b","#1f948b","#1f958b","#1f968b","#1e978a","#1e988a","#1e998a","#1e998a","#1e9a89","#1e9b89","#1e9c89","#1e9d88","#1e9e88","#1e9f88","#1ea087","#1fa187","#1fa286","#1fa386","#20a485","#20a585","#21a685","#21a784","#22a784","#23a883","#23a982","#24aa82","#25ab81","#26ac81","#27ad80","#28ae7f","#29af7f","#2ab07e","#2bb17d","#2cb17d","#2eb27c","#2fb37b","#30b47a","#32b57a","#33b679","#35b778","#36b877","#38b976","#39b976","#3bba75","#3dbb74","#3ebc73","#40bd72","#42be71","#44be70","#45bf6f","#47c06e","#49c16d","#4bc26c","#4dc26b","#4fc369","#51c468","#53c567","#55c666","#57c665","#59c764","#5bc862","#5ec961","#60c960","#62ca5f","#64cb5d","#67cc5c","#69cc5b","#6bcd59","#6dce58","#70ce56","#72cf55","#74d054","#77d052","#79d151","#7cd24f","#7ed24e","#81d34c","#83d34b","#86d449","#88d547","#8bd546","#8dd644","#90d643","#92d741","#95d73f","#97d83e","#9ad83c","#9dd93a","#9fd938","#a2da37","#a5da35","#a7db33","#aadb32","#addc30","#afdc2e","#b2dd2c","#b5dd2b","#b7dd29","#bade27","#bdde26","#bfdf24","#c2df22","#c5df21","#c7e01f","#cae01e","#cde01d","#cfe11c","#d2e11b","#d4e11a","#d7e219","#dae218","#dce218","#dfe318","#e1e318","#e4e318","#e7e419","#e9e419","#ece41a","#eee51b","#f1e51c","#f3e51e","#f6e61f","#f8e621","#fae622","#fde724"]},"id":"19582","type":"LinearColorMapper"},{"attributes":{"margin":[5,5,5,5],"name":"HSpacer118602","sizing_mode":"stretch_width"},"id":"19511","type":"Spacer"},{"attributes":{"data":{"Diameter_mm_mean":{"__ndarray__":"v1jyiyX/K0DrUbgehas0QAAAAAAAwCxA6LSBThtoKkAlv1jyi6UqQEjhehSuRy1AQacNdNpALUAfhetRuK4xQGAs+cWS3zFAiIiIiIhILkBApw102kArQNtApw10ejBAzczMzMyMLUCkcD0K16MkQMP1KFyPQiFApw102kBnI0BjyS+W/OIlQDMzMzMzEzRAvLu7u7v7KkDxiyW/WPIsQB+F61G4HitA7+7u7u7uLEAnMQisHNoyQFyPwvUoXDNAaQOdNtCJNkBcj8L1KPw3QD0K16NwvSpA8O7u7u5uKkDotIFOG+goQKRwPQrXoyZAmpmZmZl5MED2KFyPwlUyQAOdNtBpQylALfnFkl+sKkCIiIiIiCgxQPYoXI/CJTNA+cWSXyz5KEBmZmZmZiYxQA==","dtype":"float64","order":"little","shape":[38]},"Diameter_mm_stdev":{"__ndarray__":"o7oW/xXc8z+6KhAASlMBQNDKbL6mZPA/2fAjkU1W2j/R1cfcH872PwwOSgjuitE/C8oazo1/5z9szHzAoXH0P0AMJagYj/c/OLS5GHVq8D/1v8fRCukHQEYMnbqfNARAD4qxXwED/z/kBP9PjfbMP4HKcpbj89s/6L3cwBwJ5D8GmfZUVX/VP1j+1xKO3QhAglrNauRA8D8SB7u37ZEFQDqlyFsyeuc/aix5tPE2AkDEySzY9dToP1DaFWCIKvE/WevUJ4AgA0DC1O9e4zgCQDEwYuHlI+c/CkFAzKE57j/EBDg7dyT5PyTxY4zycP8/DY6KF/UzCUDGTyht7fQEQNoAn0Xk+fI/jnlIMdl9vj+IxuBXFj8FQBmTqy4R8hJA3HjV+Y/Z/D94ff2ehToGQA==","dtype":"float64","order":"little","shape":[38]},"color":{"__ndarray__":"v1jyiyX/K0DrUbgehas0QAAAAAAAwCxA6LSBThtoKkAlv1jyi6UqQEjhehSuRy1AQacNdNpALUAfhetRuK4xQGAs+cWS3zFAiIiIiIhILkBApw102kArQNtApw10ejBAzczMzMyMLUCkcD0K16MkQMP1KFyPQiFApw102kBnI0BjyS+W/OIlQDMzMzMzEzRAvLu7u7v7KkDxiyW/WPIsQB+F61G4HitA7+7u7u7uLEAnMQisHNoyQFyPwvUoXDNAaQOdNtCJNkBcj8L1KPw3QD0K16NwvSpA8O7u7u5uKkDotIFOG+goQKRwPQrXoyZAmpmZmZl5MED2KFyPwlUyQAOdNtBpQylALfnFkl+sKkCIiIiIiCgxQPYoXI/CJTNA+cWSXyz5KEBmZmZmZiYxQA==","dtype":"float64","order":"little","shape":[38]},"lat":{"__ndarray__":"P46GwM67L8GqlImANrcoweXACaI2JibByk/cEw+O98Cga9KJc6rxwKryOR3RjefAFGhJhc45Q8FyjakT0v5DwWhlc0QwADfBbpLHdsQvNsFBaoz3HPI3wXOD7Y/ONzvB8zhXS5yDNMG5uAlaSfE2wSV3Rj7SydnAjIEsCkBi9MB1Vj0l9uvewIdLEfxhpirBEsprKiWxHcFFGHthagk1wf4yIrTARDDBteLUeyg+LsFXPcts6VQxwf0vCgZEuRhB0TfNJdttB8Ezuaacd/UwwRl9HJ3mAi3Bc8LuYlIdF8GjXTIb61QlwcvR513PZyHBjQ5N22c9MMEztGoWApU7wV186ZDS9jDBLvRUn4gEI8HIYTwPKFyCQGkmboG4LzzBe7mNiZ88K8GOhpvXWXQywQ==","dtype":"float64","order":"little","shape":[38]},"lon":{"__ndarray__":"5qnlBEJaYMEjYoTHEapgwQRBl6ysu2DBkxwWg2oEY8Fmo5jARixjwShpIOSwa2PBz5+m6nTLXcGNm8C74NlcwfVto0ZcW1/BlW7vgGJuX8GZJAYkPnlewWGnbdEaK1/BxN83tFpUYMEd/DVoHgBgwXzHR9ONZ2PBpovdti4tY8GG55s/xjljwT2+AFwYgGDBCcLIuT3yYMGxw4uJiBhgwTHQajXljWDB0UOmikWKYMFXGGH+/29gwcLW+kigR2DBXFE0+TaJYMGqsyTs/0dgwTZ04UlIbWDBgIIy/wbQYMEqEtNWNoFgwSElsRXtOmHBF+5X8iiQYMGh5qZDc8hewd5UUhWTm2DBRe87U836YME8Pad/E/ZgwWVGhqGsAV/B4SVJtrHLYMEqEtNWNoFgwQ==","dtype":"float64","order":"little","shape":[38]},"size":{"__ndarray__":"zKWFltz/GkAOqn2HI+cfQNxZYnbjsxVAKHef9RH7AkAoF4w2jEkgQByaCyvczfY/vdyanOGSDkAsQVG+twAWQEIH1xuwFRlAWrXiBeChFEAVLlPgSrIwQEOuF+zfVSdATlsPy+X4I0Bp8wKQf7T6P8FXNPIT0g5A6a9gI6emE0DNo80jQLECQEC4GpV4kidAPsbEvTTtFkBQJ52uvFwsQGm4s/WFeRBAlRNWVxf2J0CCMQ8MRhEJQErKUWTS3xBAbS++y34mIEBV/12IsuocQH+ezxEKeBBAfLIgJcPCFUBSBy5EBTYjQJdq38fUbSpA0BuHJuMcLUBB75KCisAlQIVPsrrllhxA2R8AFU/B5T9cEC74qpAnQBEjDuKF1DJAkRHhASb8JUAqAzvpm6ooQA==","dtype":"float64","order":"little","shape":[38]},"species_name":["S. arcanum","S. arcanum","S. arcanum","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. chilense","S. chilense","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. galapagense","S. galapagense","S. galapagense","S. habrochaites","S. habrochaites","S. habrochaites","S. huaylasense","S. huaylasense","S. huaylasense","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. neorickii","S. neorickii","S. neorickii","S. pennellii","S. pennellii","S. pennellii","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. peruvianum","S. peruvianum","S. peruvianum"]},"selected":{"id":"19584"},"selection_policy":{"id":"19602"}},"id":"19583","type":"ColumnDataSource"},{"attributes":{"margin":[5,20,20,20],"min_width":250,"options":["Diameter_mm","Length_mm","Diam_lgth_ratio","Fresh_weight_grams","Seed_count","Tomato Pericarp Area Ratio_inside","Average Luminosity_outside","Average Hue_outside","Average Chroma_outside","Glucose_rep_avg","Fructose_rep_avg","Sucrose_rep_avg","Total_sugars","Citric_avg","Malic_avg","Total_acids"],"title":"variable","value":"Diameter_mm","width":250},"id":"19674","type":"Select"},{"attributes":{"children":[{"id":"19673"},{"id":"19674"}],"css_classes":["panel-widget-box"],"margin":[5,5,5,5],"name":"WidgetBox118592"},"id":"19672","type":"Column"},{"attributes":{"text":"species: All, variable: Diameter_mm","text_color":"black","text_font_size":"12pt"},"id":"19528","type":"Title"},{"attributes":{"bar_line_color":"black","color_mapper":{"id":"19582"},"label_standoff":8,"location":[0,0],"major_label_policy":{"id":"19599"},"major_tick_line_color":"black","ticker":{"id":"19593"}},"id":"19594","type":"ColorBar"},{"attributes":{"margin":[5,5,5,5],"name":"VSpacer118599","sizing_mode":"stretch_height"},"id":"19671","type":"Spacer"},{"attributes":{"below":[{"id":"19536"}],"center":[{"id":"19539"},{"id":"19543"}],"left":[{"id":"19540"}],"margin":[5,5,5,5],"min_border_bottom":10,"min_border_left":10,"min_border_right":10,"min_border_top":10,"renderers":[{"id":"19578"},{"id":"19591"}],"right":[{"id":"19594"}],"sizing_mode":"fixed","title":{"id":"19528"},"toolbar":{"id":"19548"},"x_range":{"id":"19518"},"x_scale":{"id":"19532"},"y_range":{"id":"19519"},"y_scale":{"id":"19534"}},"id":"19527","subtype":"Figure","type":"Plot"},{"attributes":{},"id":"19568","type":"AllLabels"},{"attributes":{},"id":"19532","type":"LinearScale"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"19582"}},"line_color":{"field":"color","transform":{"id":"19582"}},"size":{"field":"size"},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19589","type":"Scatter"}],"root_ids":["19510","19697"]},"title":"Bokeh Application","version":"2.3.1"}};
    var render_items = [{"docid":"3987513e-71f6-4fc9-bd3b-4f65154f6b65","root_ids":["19510"],"roots":{"19510":"736609c4-5c65-489d-90ea-7c4b0a78895c"}}];
    root.Bokeh.embed.embed_items_notebook(docs_json, render_items);
  }
  if (root.Bokeh !== undefined && root.Bokeh.Panel !== undefined) {
    embed_document(root);
  } else {
    var attempts = 0;
    var timer = setInterval(function(root) {
      if (root.Bokeh !== undefined && root.Bokeh.Panel !== undefined) {
        clearInterval(timer);
        embed_document(root);
      } else if (document.readyState == "complete") {
        attempts++;
        if (attempts > 100) {
          clearInterval(timer);
          console.log("Bokeh: ERROR: Unable to run BokehJS code because BokehJS library is missing");
        }
      }
    }, 10, root)
  }
})(window);</script>




```python
dmap2 = hv.DynamicMap(plotmap, kdims=['species','variable'])
dmap2.redim.values(species=['All'] + data.species_name.unique().tolist(),
                  variable=climate_variables
                 )
```






<div id='19733'>





  <div class="bk-root" id="c8167860-78ca-4c9c-8b42-d29f4ae57dd9" data-root-id="19733"></div>
</div>
<script type="application/javascript">(function(root) {
  function embed_document(root) {
    var docs_json = {"67d51993-30e6-48b3-95e1-e241b9a4d023":{"defs":[],"roots":{"references":[{"attributes":{"children":[{"id":"19734"},{"id":"19750"},{"id":"19892"},{"id":"19893"}],"margin":[0,0,0,0],"name":"Row119136"},"id":"19733","type":"Row"},{"attributes":{"source":{"id":"19806"}},"id":"19815","type":"CDSView"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"19805"}},"line_color":{"field":"color","transform":{"id":"19805"}},"size":{"value":7},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19812","type":"Scatter"},{"attributes":{"active_multi":null,"tools":[{"id":"19743"},{"id":"19744"},{"id":"19747"},{"id":"19768"},{"id":"19769"}]},"id":"19771","type":"Toolbar"},{"attributes":{"fill_alpha":{"value":0.2},"fill_color":{"field":"color","transform":{"id":"19805"}},"line_alpha":{"value":0.2},"line_color":{"field":"color","transform":{"id":"19805"}},"size":{"value":7},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19813","type":"Scatter"},{"attributes":{"code":"\n        var projections = Bokeh.require(\"core/util/projections\");\n        var x = special_vars.data_x\n        var y = special_vars.data_y\n        if (projections.wgs84_mercator.invert == null) {\n          var coords = projections.wgs84_mercator.inverse([x, y])\n        } else {\n          var coords = projections.wgs84_mercator.invert(x, y)\n        }\n        return \"\" + (coords[0]).toFixed(4)\n    "},"id":"19818","type":"CustomJSHover"},{"attributes":{},"id":"19768","type":"PanTool"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"19805"}},"line_color":{"field":"color","transform":{"id":"19805"}},"size":{"value":7},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19811","type":"Scatter"},{"attributes":{"bottom_units":"screen","fill_alpha":0.5,"fill_color":"lightgrey","left_units":"screen","level":"overlay","line_alpha":1.0,"line_color":"black","line_dash":[4,4],"line_width":2,"right_units":"screen","syncable":false,"top_units":"screen"},"id":"19770","type":"BoxAnnotation"},{"attributes":{"attribution":"&copy; <a href=\"http://downloads.esri.com/ArcGISOnline/docs/tou_summary.pdf\">Esri</a>, NatGeo, i-cubed","url":"https://server.arcgisonline.com/ArcGIS/rest/services/USA_Topo_Maps/MapServer/tile/{Z}/{Y}/{X}"},"id":"19798","type":"WMTSTileSource"},{"attributes":{"margin":[5,5,5,5],"name":"HSpacer119147","sizing_mode":"stretch_width"},"id":"19734","type":"Spacer"},{"attributes":{"dimension":"lon"},"id":"19781","type":"MercatorTickFormatter"},{"attributes":{"fill_alpha":{"value":0.1},"fill_color":{"field":"color","transform":{"id":"19805"}},"line_alpha":{"value":0.1},"line_color":{"field":"color","transform":{"id":"19805"}},"size":{"value":7},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19810","type":"Scatter"},{"attributes":{"text":"species: All, variable: Temp_C","text_color":"black","text_font_size":"12pt"},"id":"19751","type":"Title"},{"attributes":{"axis":{"id":"19759"},"grid_line_color":null,"ticker":null},"id":"19762","type":"Grid"},{"attributes":{"axis_label":"Latitude","formatter":{"id":"19783"},"major_label_policy":{"id":"19791"},"ticker":{"id":"19782"}},"id":"19763","type":"LinearAxis"},{"attributes":{"children":[{"id":"19894"},{"id":"19895"},{"id":"19898"}],"margin":[0,0,0,0],"name":"Column119146"},"id":"19893","type":"Column"},{"attributes":{"axis":{"id":"19763"},"dimension":1,"grid_line_color":null,"ticker":null},"id":"19766","type":"Grid"},{"attributes":{},"id":"19769","type":"ResetTool"},{"attributes":{},"id":"19822","type":"NoOverlap"},{"attributes":{},"id":"19755","type":"LinearScale"},{"attributes":{"bar_line_color":"black","color_mapper":{"id":"19805"},"label_standoff":8,"location":[0,0],"major_label_policy":{"id":"19822"},"major_tick_line_color":"black","ticker":{"id":"19816"}},"id":"19817","type":"ColorBar"},{"attributes":{"high":24.5,"low":7.3999999999999995,"palette":["#440154","#440255","#440357","#450558","#45065a","#45085b","#46095c","#460b5e","#460c5f","#460e61","#470f62","#471163","#471265","#471466","#471567","#471669","#47186a","#48196b","#481a6c","#481c6e","#481d6f","#481e70","#482071","#482172","#482273","#482374","#472575","#472676","#472777","#472878","#472a79","#472b7a","#472c7b","#462d7c","#462f7c","#46307d","#46317e","#45327f","#45347f","#453580","#453681","#443781","#443982","#433a83","#433b83","#433c84","#423d84","#423e85","#424085","#414186","#414286","#404387","#404487","#3f4587","#3f4788","#3e4888","#3e4989","#3d4a89","#3d4b89","#3d4c89","#3c4d8a","#3c4e8a","#3b508a","#3b518a","#3a528b","#3a538b","#39548b","#39558b","#38568b","#38578c","#37588c","#37598c","#365a8c","#365b8c","#355c8c","#355d8c","#345e8d","#345f8d","#33608d","#33618d","#32628d","#32638d","#31648d","#31658d","#31668d","#30678d","#30688d","#2f698d","#2f6a8d","#2e6b8e","#2e6c8e","#2e6d8e","#2d6e8e","#2d6f8e","#2c708e","#2c718e","#2c728e","#2b738e","#2b748e","#2a758e","#2a768e","#2a778e","#29788e","#29798e","#287a8e","#287a8e","#287b8e","#277c8e","#277d8e","#277e8e","#267f8e","#26808e","#26818e","#25828e","#25838d","#24848d","#24858d","#24868d","#23878d","#23888d","#23898d","#22898d","#228a8d","#228b8d","#218c8d","#218d8c","#218e8c","#208f8c","#20908c","#20918c","#1f928c","#1f938b","#1f948b","#1f958b","#1f968b","#1e978a","#1e988a","#1e998a","#1e998a","#1e9a89","#1e9b89","#1e9c89","#1e9d88","#1e9e88","#1e9f88","#1ea087","#1fa187","#1fa286","#1fa386","#20a485","#20a585","#21a685","#21a784","#22a784","#23a883","#23a982","#24aa82","#25ab81","#26ac81","#27ad80","#28ae7f","#29af7f","#2ab07e","#2bb17d","#2cb17d","#2eb27c","#2fb37b","#30b47a","#32b57a","#33b679","#35b778","#36b877","#38b976","#39b976","#3bba75","#3dbb74","#3ebc73","#40bd72","#42be71","#44be70","#45bf6f","#47c06e","#49c16d","#4bc26c","#4dc26b","#4fc369","#51c468","#53c567","#55c666","#57c665","#59c764","#5bc862","#5ec961","#60c960","#62ca5f","#64cb5d","#67cc5c","#69cc5b","#6bcd59","#6dce58","#70ce56","#72cf55","#74d054","#77d052","#79d151","#7cd24f","#7ed24e","#81d34c","#83d34b","#86d449","#88d547","#8bd546","#8dd644","#90d643","#92d741","#95d73f","#97d83e","#9ad83c","#9dd93a","#9fd938","#a2da37","#a5da35","#a7db33","#aadb32","#addc30","#afdc2e","#b2dd2c","#b5dd2b","#b7dd29","#bade27","#bdde26","#bfdf24","#c2df22","#c5df21","#c7e01f","#cae01e","#cde01d","#cfe11c","#d2e11b","#d4e11a","#d7e219","#dae218","#dce218","#dfe318","#e1e318","#e4e318","#e7e419","#e9e419","#ece41a","#eee51b","#f1e51c","#f3e51e","#f6e61f","#f8e621","#fae622","#fde724"]},"id":"19805","type":"LinearColorMapper"},{"attributes":{},"id":"19816","type":"BasicTicker"},{"attributes":{"end":412168.57585604145,"min_interval":5,"reset_end":412168.57585604145,"reset_start":-2632018.5166533417,"start":-2632018.5166533417,"tags":[[["Latitude","Latitude",null]]]},"id":"19742","type":"Range1d"},{"attributes":{"margin":[5,5,5,5],"name":"HSpacer119148","sizing_mode":"stretch_width"},"id":"19892","type":"Spacer"},{"attributes":{"data_source":{"id":"19806"},"glyph":{"id":"19809"},"hover_glyph":{"id":"19812"},"muted_glyph":{"id":"19813"},"nonselection_glyph":{"id":"19810"},"selection_glyph":{"id":"19811"},"view":{"id":"19815"}},"id":"19814","type":"GlyphRenderer"},{"attributes":{"below":[{"id":"19759"}],"center":[{"id":"19762"},{"id":"19766"}],"left":[{"id":"19763"}],"margin":[5,5,5,5],"min_border_bottom":10,"min_border_left":10,"min_border_right":10,"min_border_top":10,"renderers":[{"id":"19801"},{"id":"19814"}],"right":[{"id":"19817"}],"sizing_mode":"fixed","title":{"id":"19751"},"toolbar":{"id":"19771"},"x_range":{"id":"19741"},"x_scale":{"id":"19755"},"y_range":{"id":"19742"},"y_scale":{"id":"19757"}},"id":"19750","subtype":"Figure","type":"Plot"},{"attributes":{"end":-7458405.994468819,"min_interval":5,"reset_end":-7458405.994468819,"reset_start":-10352712.53245495,"start":-10352712.53245495,"tags":[[["Longitude","Longitude",null]]]},"id":"19741","type":"Range1d"},{"attributes":{"match_aspect":true,"overlay":{"id":"19770"}},"id":"19744","type":"BoxZoomTool"},{"attributes":{"client_comm_id":"8408343778f84573916e2e0afa711844","comm_id":"cf2254d3cd2a43678a55fed0a01f59ea","plot_id":"19733"},"id":"19920","type":"panel.models.comm_manager.CommManager"},{"attributes":{"zoom_on_axis":false},"id":"19743","type":"WheelZoomTool"},{"attributes":{"margin":[20,20,5,20],"min_width":250,"options":["All","S. arcanum","S. cheesmaniae","S. chilense","S. chmielewskii","S. corneliomulleri","S. galapagense","S. habrochaites","S. huaylasense","nan","S. lycopersicum var. cerasiforme","S. neorickii","S. pennellii","S. pimpinellifolium","S. peruvianum"],"title":"species","value":"All","width":250},"id":"19896","type":"Select"},{"attributes":{"margin":[5,5,5,5],"name":"VSpacer119145","sizing_mode":"stretch_height"},"id":"19898","type":"Spacer"},{"attributes":{"level":"underlay","tile_source":{"id":"19798"}},"id":"19801","type":"TileRenderer"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"19805"}},"line_color":{"field":"color","transform":{"id":"19805"}},"size":{"value":7},"x":{"field":"lon"},"y":{"field":"lat"}},"id":"19809","type":"Scatter"},{"attributes":{},"id":"19791","type":"AllLabels"},{"attributes":{"dimension":"lat","mantissas":[1,2,5]},"id":"19782","type":"MercatorTicker"},{"attributes":{"margin":[5,5,5,5],"name":"VSpacer119144","sizing_mode":"stretch_height"},"id":"19894","type":"Spacer"},{"attributes":{"margin":[5,20,20,20],"min_width":250,"options":["Temp_C","Temp_seasonality_C","Temp_warmest_q_C","Temp_coldest_q_C","Prec","Prec_seasonality","Prec_wettest_q"],"title":"variable","value":"Temp_C","width":250},"id":"19897","type":"Select"},{"attributes":{"dimension":"lon","mantissas":[1,2,5]},"id":"19780","type":"MercatorTicker"},{"attributes":{"code":"\n        var projections = Bokeh.require(\"core/util/projections\");\n        var x = special_vars.data_x\n        var y = special_vars.data_y\n        if (projections.wgs84_mercator.invert == null) {\n          var coords = projections.wgs84_mercator.inverse([x, y])\n        } else {\n          var coords = projections.wgs84_mercator.invert(x, y)\n        }\n        return \"\" + (coords[1]).toFixed(4)\n    "},"id":"19819","type":"CustomJSHover"},{"attributes":{},"id":"19784","type":"AllLabels"},{"attributes":{"axis_label":"Longitude","formatter":{"id":"19781"},"major_label_policy":{"id":"19784"},"ticker":{"id":"19780"}},"id":"19759","type":"LinearAxis"},{"attributes":{"data":{"Temp_C_mean":{"__ndarray__":"zczMzMzMLkBnZmZmZmYmQGdmZmZmZi9AZ2ZmZmZmN0BnZmZmZmY0QJqZmZmZmTZAzczMzMzMMEDNzMzMzMwgQM3MzMzMzDBAMzMzMzMzKUAzMzMzMzMnQM3MzMzMzC5AAAAAAACAMkCamZmZmZkhQM3MzMzMTDhAAAAAAACAN0CZmZmZmRk4QAAAAAAAACtAMzMzMzOzNkCZmZmZmZkdQJqZmZmZGTJAzczMzMzMK0CamZmZmZkqQJmZmZmZmTZAZ2ZmZmbmNUBnZmZmZmYeQDMzMzMzMzBAzczMzMzMKkCZmZmZmZksQAAAAAAAgDZAZ2ZmZmZmMkCZmZmZmRk0QGdmZmZmZjNAZ2ZmZmbmN0AAAAAAAIA4QDMzMzMzMzJAAAAAAAAAM0AAAAAAAAAzQA==","dtype":"float64","order":"little","shape":[38]},"Temp_C_stdev":{"__ndarray__":"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==","dtype":"float64","order":"little","shape":[38]},"color":{"__ndarray__":"zczMzMzMLkBnZmZmZmYmQGdmZmZmZi9AZ2ZmZmZmN0BnZmZmZmY0QJqZmZmZmTZAzczMzMzMMEDNzMzMzMwgQM3MzMzMzDBAMzMzMzMzKUAzMzMzMzMnQM3MzMzMzC5AAAAAAACAMkCamZmZmZkhQM3MzMzMTDhAAAAAAACAN0CZmZmZmRk4QAAAAAAAACtAMzMzMzOzNkCZmZmZmZkdQJqZmZmZGTJAzczMzMzMK0CamZmZmZkqQJmZmZmZmTZAZ2ZmZmbmNUBnZmZmZmYeQDMzMzMzMzBAzczMzMzMKkCZmZmZmZksQAAAAAAAgDZAZ2ZmZmZmMkCZmZmZmRk0QGdmZmZmZjNAZ2ZmZmbmN0AAAAAAAIA4QDMzMzMzMzJAAAAAAAAAM0AAAAAAAAAzQA==","dtype":"float64","order":"little","shape":[38]},"lat":{"__ndarray__":"P46GwM67L8GqlImANrcoweXACaI2JibByk/cEw+O98Cga9KJc6rxwKryOR3RjefAFGhJhc45Q8FyjakT0v5DwWhlc0QwADfBbpLHdsQvNsFBaoz3HPI3wXOD7Y/ONzvB8zhXS5yDNMG5uAlaSfE2wSV3Rj7SydnAjIEsCkBi9MB1Vj0l9uvewIdLEfxhpirBEsprKiWxHcFFGHthagk1wf4yIrTARDDBteLUeyg+LsFXPcts6VQxwf0vCgZEuRhB0TfNJdttB8Ezuaacd/UwwRl9HJ3mAi3Bc8LuYlIdF8GjXTIb61QlwcvR513PZyHBjQ5N22c9MMEztGoWApU7wV186ZDS9jDBLvRUn4gEI8HIYTwPKFyCQGkmboG4LzzBe7mNiZ88K8GOhpvXWXQywQ==","dtype":"float64","order":"little","shape":[38]},"lon":{"__ndarray__":"5qnlBEJaYMEjYoTHEapgwQRBl6ysu2DBkxwWg2oEY8Fmo5jARixjwShpIOSwa2PBz5+m6nTLXcGNm8C74NlcwfVto0ZcW1/BlW7vgGJuX8GZJAYkPnlewWGnbdEaK1/BxN83tFpUYMEd/DVoHgBgwXzHR9ONZ2PBpovdti4tY8GG55s/xjljwT2+AFwYgGDBCcLIuT3yYMGxw4uJiBhgwTHQajXljWDB0UOmikWKYMFXGGH+/29gwcLW+kigR2DBXFE0+TaJYMGqsyTs/0dgwTZ04UlIbWDBgIIy/wbQYMEqEtNWNoFgwSElsRXtOmHBF+5X8iiQYMGh5qZDc8hewd5UUhWTm2DBRe87U836YME8Pad/E/ZgwWVGhqGsAV/B4SVJtrHLYMEqEtNWNoFgwQ==","dtype":"float64","order":"little","shape":[38]},"species_name":["S. arcanum","S. arcanum","S. arcanum","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. chilense","S. chilense","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. galapagense","S. galapagense","S. galapagense","S. habrochaites","S. habrochaites","S. habrochaites","S. huaylasense","S. huaylasense","S. huaylasense","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. neorickii","S. neorickii","S. neorickii","S. pennellii","S. pennellii","S. pennellii","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. peruvianum","S. peruvianum","S. peruvianum"]},"selected":{"id":"19807"},"selection_policy":{"id":"19825"}},"id":"19806","type":"ColumnDataSource"},{"attributes":{},"id":"19807","type":"Selection"},{"attributes":{"callback":null,"formatters":{"$x":{"id":"19818"},"$y":{"id":"19819"}},"renderers":[{"id":"19814"}],"tags":["hv_created"],"tooltips":[["lon","$x{custom}"],["lat","$y{custom}"],["species_name","@{species_name}"],["Temp_C_mean","@{Temp_C_mean}"],["Temp_C_stdev","@{Temp_C_stdev}"]]},"id":"19747","type":"HoverTool"},{"attributes":{},"id":"19825","type":"UnionRenderers"},{"attributes":{},"id":"19757","type":"LinearScale"},{"attributes":{"children":[{"id":"19896"},{"id":"19897"}],"css_classes":["panel-widget-box"],"margin":[5,5,5,5],"name":"WidgetBox119137"},"id":"19895","type":"Column"},{"attributes":{"dimension":"lat"},"id":"19783","type":"MercatorTickFormatter"}],"root_ids":["19733","19920"]},"title":"Bokeh Application","version":"2.3.1"}};
    var render_items = [{"docid":"67d51993-30e6-48b3-95e1-e241b9a4d023","root_ids":["19733"],"roots":{"19733":"c8167860-78ca-4c9c-8b42-d29f4ae57dd9"}}];
    root.Bokeh.embed.embed_items_notebook(docs_json, render_items);
  }
  if (root.Bokeh !== undefined && root.Bokeh.Panel !== undefined) {
    embed_document(root);
  } else {
    var attempts = 0;
    var timer = setInterval(function(root) {
      if (root.Bokeh !== undefined && root.Bokeh.Panel !== undefined) {
        clearInterval(timer);
        embed_document(root);
      } else if (document.readyState == "complete") {
        attempts++;
        if (attempts > 100) {
          clearInterval(timer);
          console.log("Bokeh: ERROR: Unable to run BokehJS code because BokehJS library is missing");
        }
      }
    }, 10, root)
  }
})(window);</script>




```python
tomato_species_colors2 = {
  "S. pennellii":"#9590FF", 
  "S. habrochaites":"#39B600", 
  "S. chilense":"#CFE11CFF", 
  "S. corneliomulleri":"#00BCD8", 
  "S. peruvianum":"#FF62B6",
  "S. huaylasense":"#C99800", 
  "S. neorickii":"#00B0F6", 
  "S. arcanum":"green", 
  "S. chmielewskii":"#D89000", 
  "S. pimpinellifolium":"#E76BF3", 
  "S. lycopersicum var. cerasiforme":"#00BFC4",
  #"S. lycopersicum":"#00BF7D", 
  "S. galapagense":"#A3A500", 
  "S. cheesmaniae":"#F8766D"
}
```


```python
def plot_scatter_colored(x, y):
    return hv.Scatter(data, kdims=[x, y], vdims=['species_name', 'accession']
                     ).relabel(""
                              ).opts(xlabel='Climate variable', 
                                    ylabel='Fruit variable',
                                    color = 'species_name', cmap=tomato_species_colors2,
                                    size = 5, marker = '*',
                                    legend_position='right',
                                    width=600, height=420,
                                    tools=['hover']
                                   )
```


```python
dmap = hv.DynamicMap(plot_scatter_colored, kdims=['Climate_variable', 'Fruit_variable'])
dmap.redim.values(Climate_variable = climate_variables,
                  Fruit_variable = fruit_variables
                         ).opts(norm=dict(framewise=True))
```

    WARNING:param.Scatter: Chart elements should only be supplied a single kdim
    WARNING:param.Scatter: Chart elements should only be supplied a single kdim
    WARNING:param.Scatter: Chart elements should only be supplied a single kdim
    WARNING:param.Scatter: Chart elements should only be supplied a single kdim







<div id='20327'>





  <div class="bk-root" id="a1ab57de-4aad-4a4b-8e4b-db89ef04dad8" data-root-id="20327"></div>
</div>
<script type="application/javascript">(function(root) {
  function embed_document(root) {
    var docs_json = {"7ee2f808-4700-44b3-822e-0a53279fdfb6":{"defs":[],"roots":{"references":[{"attributes":{"label":{"field":"color"},"renderers":[{"id":"20371"}]},"id":"20384","type":"LegendItem"},{"attributes":{},"id":"20381","type":"UnionRenderers"},{"attributes":{},"id":"20339","type":"LinearScale"},{"attributes":{"items":[{"id":"20384"}],"location":[0,0]},"id":"20383","type":"Legend"},{"attributes":{"text":"Climate_variable: Temp_C, Fruit_variable: Diameter_mm","text_color":"black","text_font_size":"12pt"},"id":"20333","type":"Title"},{"attributes":{"fill_alpha":{"value":0.1},"fill_color":{"field":"color","transform":{"id":"20362"}},"line_alpha":{"value":0.1},"line_color":{"field":"color","transform":{"id":"20362"}},"marker":{"value":"asterisk"},"size":{"value":5},"x":{"field":"Temp_C"},"y":{"field":"Diameter_mm"}},"id":"20367","type":"Scatter"},{"attributes":{"client_comm_id":"c48c6a8486a049d694d7ec5f9764defd","comm_id":"c20ccfcf58f34c6297cb7ae2051a8de5","plot_id":"20327"},"id":"20454","type":"panel.models.comm_manager.CommManager"},{"attributes":{"below":[{"id":"20341"}],"center":[{"id":"20344"},{"id":"20348"},{"id":"20383"}],"height":420,"left":[{"id":"20345"}],"margin":[5,5,5,5],"min_border_bottom":10,"min_border_left":10,"min_border_right":10,"min_border_top":10,"renderers":[{"id":"20371"}],"right":[{"id":"20383"}],"sizing_mode":"fixed","title":{"id":"20333"},"toolbar":{"id":"20355"},"x_range":{"id":"20329"},"x_scale":{"id":"20337"},"y_range":{"id":"20330"},"y_scale":{"id":"20339"}},"id":"20332","subtype":"Figure","type":"Plot"},{"attributes":{"end":25.697,"reset_end":25.697,"reset_start":6.203,"start":6.203,"tags":[[["Temp_C","Temp_C",null]]]},"id":"20329","type":"Range1d"},{"attributes":{"source":{"id":"20363"}},"id":"20372","type":"CDSView"},{"attributes":{"margin":[20,20,5,20],"min_width":250,"options":["Temp_C","Temp_seasonality_C","Temp_warmest_q_C","Temp_coldest_q_C","Prec","Prec_seasonality","Prec_wettest_q"],"title":"Climate_variable","value":"Temp_C","width":250},"id":"20421","type":"Select"},{"attributes":{"callback":null,"renderers":[{"id":"20371"}],"tags":["hv_created"],"tooltips":[["Temp_C","@{Temp_C}"],["Diameter_mm","@{Diameter_mm}"],["species_name","@{species_name}"],["accession","@{accession}"]]},"id":"20331","type":"HoverTool"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"20362"}},"line_color":{"field":"color","transform":{"id":"20362"}},"marker":{"value":"asterisk"},"size":{"value":5},"x":{"field":"Temp_C"},"y":{"field":"Diameter_mm"}},"id":"20366","type":"Scatter"},{"attributes":{"margin":[5,5,5,5],"name":"HSpacer120435","sizing_mode":"stretch_width"},"id":"20417","type":"Spacer"},{"attributes":{"margin":[5,5,5,5],"name":"HSpacer120434","sizing_mode":"stretch_width"},"id":"20328","type":"Spacer"},{"attributes":{"axis":{"id":"20341"},"grid_line_color":null,"ticker":null},"id":"20344","type":"Grid"},{"attributes":{"children":[{"id":"20419"},{"id":"20420"},{"id":"20423"}],"margin":[0,0,0,0],"name":"Column120433"},"id":"20418","type":"Column"},{"attributes":{"axis_label":"Climate variable","formatter":{"id":"20377"},"major_label_policy":{"id":"20378"},"ticker":{"id":"20342"}},"id":"20341","type":"LinearAxis"},{"attributes":{"end":56.42,"reset_end":56.42,"reset_start":3.619999999999999,"start":3.619999999999999,"tags":[[["Diameter_mm","Diameter_mm",null]]]},"id":"20330","type":"Range1d"},{"attributes":{},"id":"20374","type":"BasicTickFormatter"},{"attributes":{"margin":[5,20,20,20],"min_width":250,"options":["Diameter_mm","Length_mm","Diam_lgth_ratio","Fresh_weight_grams","Seed_count","Tomato Pericarp Area Ratio_inside","Average Luminosity_outside","Average Hue_outside","Average Chroma_outside","Glucose_rep_avg","Fructose_rep_avg","Sucrose_rep_avg","Total_sugars","Citric_avg","Malic_avg","Total_acids"],"title":"Fruit_variable","value":"Diameter_mm","width":250},"id":"20422","type":"Select"},{"attributes":{},"id":"20350","type":"PanTool"},{"attributes":{"active_multi":null,"tools":[{"id":"20331"},{"id":"20349"},{"id":"20350"},{"id":"20351"},{"id":"20352"},{"id":"20353"}]},"id":"20355","type":"Toolbar"},{"attributes":{},"id":"20375","type":"AllLabels"},{"attributes":{},"id":"20364","type":"Selection"},{"attributes":{"children":[{"id":"20328"},{"id":"20332"},{"id":"20417"},{"id":"20418"}],"margin":[0,0,0,0],"name":"Row120423"},"id":"20327","type":"Row"},{"attributes":{},"id":"20342","type":"BasicTicker"},{"attributes":{"bottom_units":"screen","fill_alpha":0.5,"fill_color":"lightgrey","left_units":"screen","level":"overlay","line_alpha":1.0,"line_color":"black","line_dash":[4,4],"line_width":2,"right_units":"screen","syncable":false,"top_units":"screen"},"id":"20354","type":"BoxAnnotation"},{"attributes":{},"id":"20337","type":"LinearScale"},{"attributes":{},"id":"20346","type":"BasicTicker"},{"attributes":{"axis_label":"Fruit variable","formatter":{"id":"20374"},"major_label_policy":{"id":"20375"},"ticker":{"id":"20346"}},"id":"20345","type":"LinearAxis"},{"attributes":{"margin":[5,5,5,5],"name":"VSpacer120431","sizing_mode":"stretch_height"},"id":"20419","type":"Spacer"},{"attributes":{"axis":{"id":"20345"},"dimension":1,"grid_line_color":null,"ticker":null},"id":"20348","type":"Grid"},{"attributes":{"children":[{"id":"20421"},{"id":"20422"}],"css_classes":["panel-widget-box"],"margin":[5,5,5,5],"name":"WidgetBox120424"},"id":"20420","type":"Column"},{"attributes":{},"id":"20351","type":"WheelZoomTool"},{"attributes":{"margin":[5,5,5,5],"name":"VSpacer120432","sizing_mode":"stretch_height"},"id":"20423","type":"Spacer"},{"attributes":{},"id":"20349","type":"SaveTool"},{"attributes":{},"id":"20377","type":"BasicTickFormatter"},{"attributes":{"overlay":{"id":"20354"}},"id":"20352","type":"BoxZoomTool"},{"attributes":{},"id":"20378","type":"AllLabels"},{"attributes":{},"id":"20353","type":"ResetTool"},{"attributes":{"factors":["S. pennellii","S. habrochaites","S. chilense","S. corneliomulleri","S. peruvianum","S. huaylasense","S. neorickii","S. arcanum","S. chmielewskii","S. pimpinellifolium","S. lycopersicum var. cerasiforme","S. galapagense","S. cheesmaniae"],"palette":["#9590FF","#39B600","#CFE11CFF","#00BCD8","#FF62B6","#C99800","#00B0F6","green","#D89000","#E76BF3","#00BFC4","#A3A500","#F8766D"]},"id":"20362","type":"CategoricalColorMapper"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"20362"}},"line_color":{"field":"color","transform":{"id":"20362"}},"marker":{"value":"asterisk"},"size":{"value":5},"x":{"field":"Temp_C"},"y":{"field":"Diameter_mm"}},"id":"20369","type":"Scatter"},{"attributes":{"fill_alpha":{"value":0.2},"fill_color":{"field":"color","transform":{"id":"20362"}},"line_alpha":{"value":0.2},"line_color":{"field":"color","transform":{"id":"20362"}},"marker":{"value":"asterisk"},"size":{"value":5},"x":{"field":"Temp_C"},"y":{"field":"Diameter_mm"}},"id":"20370","type":"Scatter"},{"attributes":{"data":{"Diameter_mm":{"__ndarray__":"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","dtype":"float64","order":"little","shape":[233]},"Temp_C":{"__ndarray__":"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","dtype":"float64","order":"little","shape":[233]},"accession":["SA-05","SA-05","SA-05","SA-05","SA-05","SA-05","SA-09","SA-09","SA-09","SA-09","SA-09","SA-09","SA-18","SA-18","SA-18","SA-18","SA-18","SA-18","SC-19","SC-19","SC-19","SC-19","SC-19","SC-19","SC-22","SC-22","SC-22","SC-22","SC-22","SC-22","SC-31","SC-31","SC-31","SC-31","SCH-06","SCH-06","SCH-06","SCH-06","SCH-06","SCH-06","SCH-08","SCH-08","SCH-08","SCH-08","SCM-01","SCM-01","SCM-01","SCM-01","SCM-01","SCM-01","SCM-03","SCM-03","SCM-03","SCM-03","SCM-03","SCM-03","SCM-11","SCM-11","SCM-11","SCM-11","SCM-11","SCM-11","SCR-07","SCR-07","SCR-07","SCR-07","SCR-07","SCR-07","SCR-08","SCR-08","SCR-08","SCR-08","SCR-08","SCR-08","SCR-09","SCR-09","SG-15","SG-15","SG-15","SG-15","SG-15","SG-15","SG-23","SG-23","SG-23","SG-23","SG-23","SG-23","SG-30","SG-30","SG-30","SG-30","SG-30","SG-30","SH-01","SH-01","SH-01","SH-01","SH-01","SH-01","SH-02","SH-02","SH-02","SH-02","SH-02","SH-02","SH-05","SH-05","SH-05","SH-05","SH-05","SH-05","SHY-01","SHY-01","SHY-01","SHY-01","SHY-02","SHY-02","SHY-02","SHY-02","SHY-02","SHY-02","SHY-03","SHY-03","SHY-03","SHY-03","SHY-03","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","SLC-10","SLC-10","SLC-10","SLC-10","SLC-10","SLC-10","SLC-B5","SLC-B5","SLC-B5","SLC-B5","SLC-B5","SLC-B5","SLC-B8","SLC-B8","SLC-B8","SLC-B8","SLC-B8","SLC-B8","SN-02","SN-02","SN-02","SN-02","SN-02","SN-02","SN-06","SN-06","SN-06","SN-06","SN-06","SN-06","SN-08","SN-08","SN-08","SN-08","SN-08","SN-08","SPE-16","SPE-16","SPE-16","SPE-16","SPE-16","SPE-16","SPE-20","SPE-20","SPE-20","SPE-20","SPE-20","SPE-20","SPE-21","SPE-21","SPE-21","SPE-21","SPE-21","SPE-21","SPM-01","SPM-01","SPM-01","SPM-01","SPM-01","SPM-01","SPM-B5","SPM-B5","SPM-B5","SPM-B5","SPM-B5","SPM-B5","SPM-B6","SPM-B6","SPM-B6","SPM-B6","SPM-B6","SPM-B6","SPV-02","SPV-02","SPV-02","SPV-02","SPV-04","SPV-04","SPV-04","SPV-04","SPV-04","SPV-04","SPV-09","SPV-09","SPV-09","SPV-09","SPV-09","SPV-09"],"color":["S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum"],"species_name":["S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. arcanum","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. cheesmaniae","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chilense","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. chmielewskii","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. corneliomulleri","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. galapagense","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. habrochaites","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","S. huaylasense","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","nan","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. lycopersicum var. cerasiforme","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. neorickii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pennellii","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. pimpinellifolium","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum","S. peruvianum"]},"selected":{"id":"20364"},"selection_policy":{"id":"20381"}},"id":"20363","type":"ColumnDataSource"},{"attributes":{"data_source":{"id":"20363"},"glyph":{"id":"20366"},"hover_glyph":{"id":"20369"},"muted_glyph":{"id":"20370"},"nonselection_glyph":{"id":"20367"},"selection_glyph":{"id":"20368"},"view":{"id":"20372"}},"id":"20371","type":"GlyphRenderer"},{"attributes":{"fill_color":{"field":"color","transform":{"id":"20362"}},"line_color":{"field":"color","transform":{"id":"20362"}},"marker":{"value":"asterisk"},"size":{"value":5},"x":{"field":"Temp_C"},"y":{"field":"Diameter_mm"}},"id":"20368","type":"Scatter"}],"root_ids":["20327","20454"]},"title":"Bokeh Application","version":"2.3.1"}};
    var render_items = [{"docid":"7ee2f808-4700-44b3-822e-0a53279fdfb6","root_ids":["20327"],"roots":{"20327":"a1ab57de-4aad-4a4b-8e4b-db89ef04dad8"}}];
    root.Bokeh.embed.embed_items_notebook(docs_json, render_items);
  }
  if (root.Bokeh !== undefined && root.Bokeh.Panel !== undefined) {
    embed_document(root);
  } else {
    var attempts = 0;
    var timer = setInterval(function(root) {
      if (root.Bokeh !== undefined && root.Bokeh.Panel !== undefined) {
        clearInterval(timer);
        embed_document(root);
      } else if (document.readyState == "complete") {
        attempts++;
        if (attempts > 100) {
          clearInterval(timer);
          console.log("Bokeh: ERROR: Unable to run BokehJS code because BokehJS library is missing");
        }
      }
    }, 10, root)
  }
})(window);</script>



# Lessons learned, future work etc.



```python

```

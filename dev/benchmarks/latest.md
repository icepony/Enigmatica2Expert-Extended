## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
435.19 sec
<br>
<sup><sub>(
7:15 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [287.94]},
      {label: 'FML stuff:', data: [147.25]}
    ]
  },
  options: {
    scales: {
      xAxes: [{display: false,stacked: true}],
      yAxes: [{display: false,stacked: true}],
    },
    elements: {rectangle: {borderWidth: 2}},
    legend: {display: false,},
    plugins: {datalabels: {color: 'white',formatter: (value, context) =>
      [context.dataset.label, value].join(' ')
    }}
  }
}"/>
</p>

<br>

# Mods Loading Time
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=300&c={
  type: 'outlabeledPie',
  options: {
    cutoutPercentage: 25,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v,i)=>[
          v.labels[v.dataIndex],' ',
          (v.percent*1000|0)/10,
          String.fromCharCode(37)].join('')
      }
    }
  },
  data: {...
`
436e17  12.96s Had Enough Items;
3C6315  12.89s Had Enough Items (Plugins);
3C6315   1.74s Had Enough Items (Ingredient Filter);
516fa8  11.33s Ender IO;
5161a8   9.67s CraftTweaker2;
813e81   8.14s OpenComputers;
5c308f   7.05s Mod Tweaker;
8f3087   6.91s Forge Mod Loader;
8f304e   6.84s Astral Sorcery;
cd922c   6.17s NuclearCraft;
a651a8   5.80s IndustrialCraft 2;
8c2ccd   5.66s Immersive Engineering;
6e175e   5.29s Recurrent Complex;
213664   4.62s Forestry;
8f4d30   3.86s Open Terrain Generator;
308f53   3.54s Village Names;
216364   3.53s Xaero's Minimap;
3e7d81   3.44s ProbeZS;
176e43   3.38s Thaumic Additions: Reconstructed;
436e17   3.37s Integrated Dynamics;
a86e51   3.33s Extra Utilities 2;
2c3e5a   3.19s Xaero's World Map;
444444  87.82s 48 Other mods;
333333  60.84s 180 'Fast' mods (load 1.0s - 0.1s);
222222   6.59s 200 'Instant' mods (load %3C 0.1s)
`
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*)s (.*)/)
      .slice(1).map((a, i) => [[String.fromCharCode(35),a].join(''), parseFloat(a), a][i])
      .forEach((s, i) => 
        [a.datasets[0].backgroundColor, a.datasets[0].data, a.labels][i].push(s)
      );
      return a
    }, {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 1
      }]
    })
  }
}"/>
</p>

<br>

# Top Mods Details (except JEI, FML and Forge)
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=450&c={
  options: {
    scales: {
      xAxes: [{stacked: true}],
      yAxes: [{stacked: true}],
    },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'top',
        color: 'white',
        backgroundColor: 'rgba(46, 140, 171, 0.6)',
        borderColor: 'rgba(41, 168, 194, 1.0)',
        borderWidth: 0.5,
        borderRadius: 3,
        padding: 0,
        font: {size:10},
        formatter: (v,ctx) => 
          ctx.datasetIndex!=ctx.chart.data.datasets.length-1 ? null
            : [((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex],0)*10)|0)/10,'s'].join('')
      },
      colorschemes: {
        scheme: 'office.Damask6'
      }
    }
  },
  type: 'bar',
  data: {...(() => {
    let a = { labels: [], datasets: [] };
`
1: Construction;
2: Loading Resources;
3: PreInitialization;
4: Initialization;
5: InterModComms$IMC;
6: PostInitialization;
7: LoadComplete;
8: ModIdMapping
`
    .split(';')
      .map(l => l.match(/\d: (.*)/).slice(1))
      .forEach(([name]) => a.datasets.push({ label: name, data: [] }));
`
                           1      2      3      4      5      6      7      8  ;
Ender IO               |  1.65|  0.01|  3.42|  0.50|  3.38|  1.15|  0.00|  1.22;
CraftTweaker2          |  0.56|  0.00|  3.98|  0.01|  0.00|  5.05|  0.07|  0.00;
OpenComputers          |  0.45|  0.02|  4.31|  3.15|  0.21|  0.00|  0.00|  0.00;
Mod Tweaker            |  0.00|  0.00|  0.01|  0.00|  0.00|  0.00|  7.04|  0.00;
Astral Sorcery         |  0.22|  0.01|  4.46|  1.50|  0.00|  0.66|  0.00|  0.00;
NuclearCraft           |  1.45|  0.01|  3.41|  0.45|  0.00|  0.81|  0.00|  0.06;
IndustrialCraft 2      |  0.72|  0.02|  3.97|  0.82|  0.00|  0.27|  0.00|  0.00;
Immersive Engineering  |  0.91|  0.01|  1.11|  0.98|  0.00|  2.65|  0.00|  0.00;
Recurrent Complex      |  0.31|  0.00|  0.71|  0.91|  0.00|  3.36|  0.00|  0.00;
Forestry               |  0.35|  0.01|  2.94|  0.99|  0.00|  0.32|  0.00|  0.00;
Open Terrain Generator |  0.09|  0.01|  0.00|  3.76|  0.00|  0.00|  0.00|  0.00;
Village Names          |  0.12|  0.00|  3.23|  0.20|  0.00|  0.00|  0.00|  0.00
`
    .split(';').slice(1)
      .map(l => l.split('|').map(s => s.trim()))
      .forEach(([name, ...arr], i) => {
        a.labels.push(name);
        arr.forEach((v, j) => a.datasets[j].data[i] = v)
      }); return a
  })()}
}"/>
</p>

<br>

# TOP JEI Registered Plugis
<p align="center">
<img src="https://quickchart.io/chart?w=700&c={
  options: {
    elements: { rectangle: { borderWidth: 1 } },
    legend: false
  },
  type: 'horizontalBar',
    data: {...(() => {
      let a = {
        labels: [], datasets: [{
          backgroundColor: 'rgba(0, 99, 132, 0.5)',
          borderColor: 'rgb(0, 99, 132)',
          data: []
        }]
      };
`
  2.17: jeresources.jei.JEIConfig;
  1.06: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.82: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.76: ic2.jeiIntegration.SubModule;
  0.72: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.51: com.buuz135.industrial.jei.JEICustomPlugin;
  0.47: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.42: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.41: nc.integration.jei.NCJEI;
  0.40: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.25: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.24: net.bdew.jeibees.BeesJEIPlugin;
  0.21: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.21: lach_01298.qmd.jei.QMDJEI;
  0.20: astavie.thermallogistics.compat.jei.CompatJEI;
  4.03: Other 126 Plugins
`
        .split(';')
        .map(l => l.split(':'))
        .forEach(([time, name]) => {
          a.labels.push(name);
          a.datasets[0].data.push(time)
        })
        ; return a
    })()
  }
}"/>
</p>

<br>

# FML Stuff
<p align="center">
<img src="https://quickchart.io/chart?w=500&h=400&c={
  options: {
    rotation: Math.PI,
    cutoutPercentage: 55,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v)=>v.labels
      },
      doughnutlabel: {
        labels: [
          {
            text: 'FML stuff:',
            color: 'rgba(128, 128, 128, 0.5)',
            font: {size: 18}
          },
          {
            text: [147.25,'s'].join(''),
            color: 'rgba(128, 128, 128, 1)',
            font: {size: 22}
          }
        ]
      },
    }
  },
  type: 'outlabeledPie',
  data: {...(() => {
    let a = {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 2
      }]
    };
`
993A00   0.56s Loading sounds;
994400   0.63s Loading Resource - SoundHandler;
994F00  35.85s ModelLoader: blocks;
995900  12.16s ModelLoader: items;
996300  15.55s ModelLoader: baking;
996D00   2.39s Applying remove recipe actions;
997700   0.19s Applying remove furnace recipe actions;
998200   0.88s Indexing ingredients;
444444  79.05s Other
`
    .split(';')
      .map(l => l.match(/(\w{6}) *(\d*\.\d*)s (.*)/))
      .forEach(([, col, time, name]) => {
        a.labels.push([name, ' ', time, 's'].join(''));
        a.datasets[0].data.push(parseFloat(time));
        a.datasets[0].backgroundColor.push([String.fromCharCode(35), col].join(''))
      })
      ; return a
  })()}
}"/>
</p>

<br>

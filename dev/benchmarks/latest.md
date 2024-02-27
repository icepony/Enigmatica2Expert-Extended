## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
419.97 sec
<br>
<sup><sub>(
6:59 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [311.64]},
      {label: 'FML stuff:', data: [108.34]}
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
436e17  15.02s Had Enough Items;
3C6315  14.85s Had Enough Items (Plugins);
3C6315   2.08s Had Enough Items (Ingredient Filter);
516fa8  12.09s Ender IO;
5161a8  11.11s CraftTweaker2;
5c308f   9.97s Mod Tweaker;
813e81   8.69s OpenComputers;
8f3087   7.52s Forge Mod Loader;
8f304e   7.34s Astral Sorcery;
a651a8   6.71s IndustrialCraft 2;
cd922c   6.38s NuclearCraft;
6e175e   6.08s Recurrent Complex;
8c2ccd   6.06s Immersive Engineering;
213664   5.27s Forestry;
8f4d30   4.10s Open Terrain Generator;
3e7d81   3.79s ProbeZS;
308f53   3.77s Village Names;
436e17   3.56s Integrated Dynamics;
a86e51   3.56s Extra Utilities 2;
216364   3.45s Xaero's Minimap;
216364   3.42s Thermal Expansion;
308f7e   3.38s Quark: RotN Edition;
444444  94.59s 51 Other mods;
333333  62.26s 182 'Fast' mods (load 1.0s - 0.1s);
222222   6.61s 195 'Instant' mods (load %3C 0.1s)
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
Ender IO               |  1.78|  0.01|  4.30|  0.57|  4.06|  0.17|  0.00|  1.20;
CraftTweaker2          |  0.65|  0.00|  4.32|  0.01|  0.00|  6.05|  0.08|  0.00;
Mod Tweaker            |  0.01|  0.00|  0.01|  0.00|  0.00|  0.00|  9.96|  0.00;
OpenComputers          |  0.35|  0.02|  4.68|  3.39|  0.25|  0.00|  0.00|  0.00;
Astral Sorcery         |  0.24|  0.01|  4.82|  1.61|  0.00|  0.66|  0.00|  0.00;
IndustrialCraft 2      |  0.78|  0.02|  4.59|  1.02|  0.00|  0.29|  0.00|  0.00;
NuclearCraft           |  1.33|  0.01|  3.65|  0.49|  0.00|  0.86|  0.00|  0.06;
Recurrent Complex      |  0.33|  0.00|  0.77|  0.98|  0.00|  4.00|  0.00|  0.00;
Immersive Engineering  |  0.95|  0.01|  1.26|  1.15|  0.00|  2.69|  0.00|  0.00;
Forestry               |  0.41|  0.01|  3.31|  1.19|  0.00|  0.35|  0.00|  0.00;
Open Terrain Generator |  0.07|  0.01|  0.00|  4.03|  0.00|  0.00|  0.00|  0.00;
ProbeZS                |  0.04|  0.00|  0.11|  0.00|  0.00|  3.64|  0.00|  0.00
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
  2.51: jeresources.jei.JEIConfig;
  1.26: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.90: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.89: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.87: ic2.jeiIntegration.SubModule;
  0.66: com.buuz135.industrial.jei.JEICustomPlugin;
  0.50: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.50: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.46: nc.integration.jei.NCJEI;
  0.44: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.30: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.28: net.bdew.jeibees.BeesJEIPlugin;
  0.26: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.25: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.23: lach_01298.qmd.jei.QMDJEI;
  4.54: Other 126 Plugins
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
            text: [108.34,'s'].join(''),
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
993A00   0.58s Loading sounds;
994400   0.66s Loading Resource - SoundHandler;
994F00   2.72s Applying remove recipe actions;
995900   0.23s Applying remove furnace recipe actions;
996300   0.97s Indexing ingredients;
444444 103.18s Other
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

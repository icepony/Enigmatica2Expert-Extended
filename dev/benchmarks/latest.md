## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
463.99 sec
<br>
<sup><sub>(
7:43 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [310.34]},
      {label: 'FML stuff:', data: [153.64]}
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
436e17  14.55s Had Enough Items;
3C6315  15.44s Had Enough Items (Plugins);
3C6315   1.78s Had Enough Items (Ingredient Filter);
51a857  13.10s Caliper;
516fa8  10.51s Ender IO;
5161a8   9.95s CraftTweaker2;
813e81   8.44s OpenComputers;
8f304e   7.74s Astral Sorcery;
5c308f   7.42s Mod Tweaker;
cd922c   7.22s NuclearCraft;
a651a8   6.35s IndustrialCraft 2;
8f3087   6.24s Forge Mod Loader;
6e175e   5.58s Recurrent Complex;
8c2ccd   5.37s Immersive Engineering;
213664   5.04s Forestry;
a86e51   4.17s Extra Utilities 2;
436e17   4.09s Integrated Dynamics;
3e7d81   3.78s ProbeZS;
308f53   3.76s Village Names;
308f7e   3.37s Quark: RotN Edition;
ba3eb8   3.28s Cyclic;
315a2c   3.16s Mekanism Community Edition;
444444  89.40s 49 Other mods;
333333  63.80s 180 'Fast' mods (load 1.0s - 0.1s);
222222   6.80s 202 'Instant' mods (load %3C 0.1s)
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
Caliper               |  0.05|  0.00|  0.05|  0.00|  0.00|  0.00| 13.00|  0.00;
Ender IO              |  1.69|  0.01|  3.98|  0.53|  3.24|  0.15|  0.00|  0.92;
CraftTweaker2         |  0.70|  0.00|  4.21|  0.01|  0.00|  4.96|  0.07|  0.00;
OpenComputers         |  0.31|  0.02|  4.74|  3.15|  0.22|  0.00|  0.00|  0.00;
Astral Sorcery        |  0.24|  0.01|  5.28|  1.68|  0.00|  0.54|  0.00|  0.00;
Mod Tweaker           |  0.00|  0.00|  0.01|  0.00|  0.00|  0.00|  7.41|  0.00;
NuclearCraft          |  1.31|  0.01|  4.17|  0.44|  0.00|  1.23|  0.00|  0.05;
IndustrialCraft 2     |  0.74|  0.02|  4.40|  0.93|  0.00|  0.26|  0.00|  0.00;
Recurrent Complex     |  0.29|  0.00|  0.74|  0.90|  0.00|  3.65|  0.00|  0.00;
Immersive Engineering |  0.87|  0.01|  1.17|  1.01|  0.00|  2.32|  0.00|  0.00;
Forestry              |  0.40|  0.01|  3.24|  0.98|  0.00|  0.40|  0.00|  0.00;
Extra Utilities 2     |  0.14|  0.00|  3.73|  0.07|  0.00|  0.24|  0.00|  0.00
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
  2.33: jeresources.jei.JEIConfig;
  1.26: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.88: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.86: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.82: ic2.jeiIntegration.SubModule;
  0.76: com.buuz135.industrial.jei.JEICustomPlugin;
  0.70: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.58: nc.integration.jei.NCJEI;
  0.51: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.49: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.45: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.38: com.github.sokyranthedragon.mia.integrations.jer.JeiJerIntegration$1;
  0.27: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.26: net.bdew.jeibees.BeesJEIPlugin;
  0.24: lach_01298.qmd.jei.QMDJEI;
  4.68: Other 125 Plugins
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
            text: [153.64,'s'].join(''),
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
993A00   0.59s Loading sounds;
994400   0.66s Loading Resource - SoundHandler;
994F00  37.19s ModelLoader: blocks;
995900  12.35s ModelLoader: items;
996300  16.38s ModelLoader: baking;
996D00   2.32s Applying remove recipe actions;
997700   0.24s Applying remove furnace recipe actions;
998200   0.82s Indexing ingredients;
444444  83.10s Other
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

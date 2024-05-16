## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
325.21 sec
<br>
<sup><sub>(
5:25 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [127.07]},
      {label: 'FML stuff:', data: [198.14]}
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
8f3087  20.38s Forge Mod Loader;
8f304e   5.03s Astral Sorcery;
813e81   4.74s OpenComputers;
cd922c   4.22s NuclearCraft;
516fa8   3.93s Ender IO;
a651a8   3.88s IndustrialCraft 2;
5161a8   2.81s CraftTweaker2;
495797   7.58s CraftTweaker2 (Script Loading);
213664   2.37s Forestry;
308f7e   2.22s Quark: RotN Edition;
436e17   2.00s Integrated Dynamics;
ba3eb8   1.96s Cyclic;
3e8160   1.79s The Twilight Forest;
a86e51   1.79s Extra Utilities 2;
8451a8   1.73s LibrarianLib Stage 2;
3eb2ba   1.61s Botania;
3eba85   1.56s Just Enough Magiculture;
8c2ccd   1.49s Immersive Engineering;
3e68ba   1.34s AE2 Unofficial Extended Life;
8f4d30   1.34s Open Terrain Generator;
3e6cba   1.31s Random Things;
444444  10.39s 9 Other mods;
333333  41.88s 136 'Fast' mods (load 1.0s - 0.1s);
222222   7.31s 283 'Instant' mods (load %3C 0.1s)
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
Astral Sorcery      |  0.19|  0.00|  4.35|  0.50|  0.00|  0.00|  0.00|  0.00;
OpenComputers       |  0.28|  0.00|  3.02|  1.44|  0.00|  0.00|  0.00|  0.00;
NuclearCraft        |  2.12|  0.00|  1.91|  0.19|  0.00|  0.00|  0.00|  0.00;
Ender IO            |  1.31|  0.00|  2.45|  0.17|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2   |  0.65|  0.00|  2.79|  0.43|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2       |  0.45|  0.00|  2.35|  0.00|  0.00|  0.00|  0.00|  0.00;
Forestry            |  0.31|  0.00|  1.77|  0.28|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition |  0.02|  0.00|  2.14|  0.06|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics |  0.28|  0.00|  1.68|  0.03|  0.00|  0.00|  0.00|  0.00;
Cyclic              |  0.05|  0.00|  1.53|  0.37|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest |  0.62|  0.00|  1.08|  0.09|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2   |  0.06|  0.00|  1.72|  0.01|  0.00|  0.00|  0.00|  0.00
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
  2.68: jeresources.jei.JEIConfig;
  0.99: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.46: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.45: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.41: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.36: com.buuz135.industrial.jei.JEICustomPlugin;
  0.32: ic2.jeiIntegration.SubModule;
  0.23: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.22: nc.integration.jei.NCJEI;
  0.19: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.16: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.15: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.13: crafttweaker.mods.jei.JEIAddonPlugin;
  0.09: net.bdew.jeibees.BeesJEIPlugin;
  0.08: lach_01298.qmd.jei.QMDJEI;
  1.11: Other 119 Plugins
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
            text: [198.14,'s'].join(''),
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
993A00   0.24s Loading sounds;
994400   0.27s Loading Resource - SoundHandler;
994F00  29.17s ModelLoader: blocks;
995900   6.95s ModelLoader: items;
996300  13.42s ModelLoader: baking;
444444 148.09s Other
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

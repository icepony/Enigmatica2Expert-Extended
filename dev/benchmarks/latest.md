## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
289.89 sec
<br>
<sup><sub>(
4:49 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [107.79]},
      {label: 'FML stuff:', data: [182.10]}
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
813e81   5.46s OpenComputers;
8f304e   5.12s Astral Sorcery;
a651a8   4.10s IndustrialCraft 2;
516fa8   4.06s Ender IO;
cd922c   3.39s NuclearCraft;
3eba85   2.71s Just Enough Magiculture;
213664   2.66s Forestry;
5161a8   2.24s CraftTweaker2;
495797   9.96s CraftTweaker2 (Script Loading);
a86e51   2.21s Extra Utilities 2;
ba3eb8   2.10s Cyclic;
308f7e   2.05s Quark: RotN Edition;
8f4d30   1.94s Open Terrain Generator;
3e8160   1.93s The Twilight Forest;
436e17   1.89s Integrated Dynamics;
3eb2ba   1.61s Botania;
8c2ccd   1.61s Immersive Engineering;
5a352c   1.57s Shadowfacts' Forgelin;
649e21   1.48s OpenBlocks;
61176e   1.43s Ice and Fire;
3e68ba   1.37s AE2 Unofficial Extended Life;
444444  10.42s 9 Other mods;
333333  38.33s 125 'Fast' mods (load 1.0s - 0.1s);
222222   8.11s 306 'Instant' mods (load %3C 0.1s)
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
OpenComputers           |  0.14|  0.00|  3.11|  2.21|  0.00|  0.00|  0.00|  0.00;
Astral Sorcery          |  0.17|  0.00|  4.31|  0.64|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2       |  0.49|  0.00|  2.96|  0.64|  0.00|  0.00|  0.00|  0.00;
Ender IO                |  1.42|  0.00|  2.42|  0.22|  0.00|  0.00|  0.00|  0.00;
NuclearCraft            |  1.18|  0.00|  1.96|  0.25|  0.00|  0.00|  0.00|  0.00;
Just Enough Magiculture |  0.09|  0.00|  0.00|  2.62|  0.00|  0.00|  0.00|  0.00;
Forestry                |  0.43|  0.00|  1.77|  0.46|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2           |  0.09|  0.00|  2.15|  0.00|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2       |  0.03|  0.00|  2.16|  0.02|  0.00|  0.00|  0.00|  0.00;
Cyclic                  |  0.05|  0.01|  1.57|  0.48|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition     |  0.02|  0.00|  1.92|  0.11|  0.00|  0.00|  0.00|  0.00;
Open Terrain Generator  |  0.04|  0.00|  0.00|  1.90|  0.00|  0.00|  0.00|  0.00
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
  1.86: jeresources.jei.JEIConfig;
  0.99: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.54: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.49: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.44: com.buuz135.industrial.jei.JEICustomPlugin;
  0.40: ic2.jeiIntegration.SubModule;
  0.28: nc.integration.jei.NCJEI;
  0.27: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.23: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.21: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.16: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.13: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.13: crafttweaker.mods.jei.JEIAddonPlugin;
  0.12: lach_01298.qmd.jei.QMDJEI;
  0.08: forestry.factory.recipes.jei.FactoryJeiPlugin;
  1.46: Other 124 Plugins
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
            text: [182.10,'s'].join(''),
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
993A00   0.35s Loading sounds;
994400   0.43s Loading Resource - SoundHandler;
444444 181.32s Other
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

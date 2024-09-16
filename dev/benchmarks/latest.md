## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
284.61 sec
<br>
<sup><sub>(
4:44 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [111.54]},
      {label: 'FML stuff:', data: [173.07]}
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
8f304e   5.29s Astral Sorcery;
813e81   5.11s OpenComputers;
a651a8   4.45s IndustrialCraft 2;
516fa8   4.43s Ender IO;
cd922c   3.83s NuclearCraft;
5161a8   2.78s CraftTweaker2;
495797   9.20s CraftTweaker2 (Script Loading);
213664   2.71s Forestry;
308f7e   2.15s Quark: RotN Edition;
ba3eb8   2.14s Cyclic;
436e17   2.10s Integrated Dynamics;
3e8160   1.99s The Twilight Forest;
3eba85   1.99s Just Enough Magiculture;
8f4d30   1.93s Open Terrain Generator;
a86e51   1.82s Extra Utilities 2;
3eb2ba   1.65s Botania;
8c2ccd   1.64s Immersive Engineering;
5a352c   1.45s Shadowfacts' Forgelin;
61176e   1.44s Ice and Fire;
649e21   1.44s OpenBlocks;
814a3e   1.42s RFTools;
444444  12.91s 11 Other mods;
333333  39.30s 131 'Fast' mods (load 1.0s - 0.1s);
222222   7.59s 296 'Instant' mods (load %3C 0.1s)
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
Astral Sorcery          |  0.19|  0.00|  4.47|  0.63|  0.00|  0.00|  0.00|  0.00;
OpenComputers           |  0.14|  0.00|  3.39|  1.58|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2       |  0.66|  0.00|  3.19|  0.59|  0.00|  0.00|  0.00|  0.00;
Ender IO                |  1.24|  0.00|  2.87|  0.32|  0.00|  0.00|  0.00|  0.00;
NuclearCraft            |  1.17|  0.00|  2.42|  0.24|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2           |  0.21|  0.00|  2.57|  0.00|  0.00|  0.00|  0.00|  0.00;
Forestry                |  0.33|  0.00|  2.01|  0.37|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition     |  0.02|  0.00|  2.04|  0.09|  0.00|  0.00|  0.00|  0.00;
Cyclic                  |  0.06|  0.00|  1.66|  0.42|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics     |  0.15|  0.00|  1.91|  0.04|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest     |  0.65|  0.00|  1.20|  0.14|  0.00|  0.00|  0.00|  0.00;
Just Enough Magiculture |  0.09|  0.00|  0.00|  1.89|  0.00|  0.00|  0.00|  0.00
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
  2.74: jeresources.jei.JEIConfig;
  0.93: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.59: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.49: com.buuz135.industrial.jei.JEICustomPlugin;
  0.42: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.39: ic2.jeiIntegration.SubModule;
  0.38: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.31: nc.integration.jei.NCJEI;
  0.24: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.18: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.18: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.16: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.12: crafttweaker.mods.jei.JEIAddonPlugin;
  0.11: thelm.packagedauto.integration.jei.PackagedAutoJEIPlugin;
  0.11: net.bdew.jeibees.BeesJEIPlugin;
  1.80: Other 124 Plugins
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
            text: [173.07,'s'].join(''),
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
993A00   0.46s Loading sounds;
994400   0.50s Loading Resource - SoundHandler;
444444 172.11s Other
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

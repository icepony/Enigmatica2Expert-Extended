## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
277.28 sec
<br>
<sup><sub>(
4:37 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [105.85]},
      {label: 'FML stuff:', data: [171.43]}
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
813e81   5.10s OpenComputers;
8f304e   4.99s Astral Sorcery;
516fa8   4.53s Ender IO;
a651a8   4.46s IndustrialCraft 2;
cd922c   3.65s NuclearCraft;
213664   2.59s Forestry;
5161a8   2.51s CraftTweaker2;
495797  10.53s CraftTweaker2 (Script Loading);
436e17   2.12s Integrated Dynamics;
ba3eb8   2.09s Cyclic;
308f7e   2.02s Quark: RotN Edition;
3e8160   1.90s The Twilight Forest;
a86e51   1.88s Extra Utilities 2;
649e21   1.68s OpenBlocks;
3eb2ba   1.59s Botania;
8c2ccd   1.57s Immersive Engineering;
5a352c   1.51s Shadowfacts' Forgelin;
8f4d30   1.49s Open Terrain Generator;
3e68ba   1.34s AE2 Unofficial Extended Life;
814a3e   1.28s RFTools;
a0ba3e   1.26s HammerLib;
444444  10.35s 9 Other mods;
333333  38.12s 127 'Fast' mods (load 1.0s - 0.1s);
222222   7.81s 302 'Instant' mods (load %3C 0.1s)
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
OpenComputers       |  0.14|  0.00|  3.16|  1.80|  0.00|  0.00|  0.00|  0.00;
Astral Sorcery      |  0.18|  0.00|  4.19|  0.62|  0.00|  0.00|  0.00|  0.00;
Ender IO            |  1.30|  0.00|  3.01|  0.22|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2   |  0.65|  0.00|  3.23|  0.59|  0.00|  0.00|  0.00|  0.00;
NuclearCraft        |  1.22|  0.00|  2.24|  0.18|  0.00|  0.00|  0.00|  0.00;
Forestry            |  0.40|  0.00|  1.87|  0.32|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2       |  0.11|  0.00|  2.40|  0.00|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics |  0.14|  0.00|  1.94|  0.03|  0.00|  0.00|  0.00|  0.00;
Cyclic              |  0.03|  0.00|  1.71|  0.34|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition |  0.02|  0.00|  1.94|  0.06|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest |  0.66|  0.00|  1.13|  0.10|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2   |  0.04|  0.00|  1.83|  0.02|  0.00|  0.00|  0.00|  0.00
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
  1.88: jeresources.jei.JEIConfig;
  1.15: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.51: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.46: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.45: com.buuz135.industrial.jei.JEICustomPlugin;
  0.44: ic2.jeiIntegration.SubModule;
  0.27: nc.integration.jei.NCJEI;
  0.24: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.24: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.20: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.19: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.17: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.12: lach_01298.qmd.jei.QMDJEI;
  0.10: crafttweaker.mods.jei.JEIAddonPlugin;
  0.08: net.bdew.jeibees.BeesJEIPlugin;
  1.42: Other 124 Plugins
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
            text: [171.43,'s'].join(''),
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
993A00   0.20s Loading sounds;
994400   0.27s Loading Resource - SoundHandler;
444444 170.97s Other
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

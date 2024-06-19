## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
251.76 sec
<br>
<sup><sub>(
4:11 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [104.02]},
      {label: 'FML stuff:', data: [147.74]}
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
8f304e   5.01s Astral Sorcery;
813e81   4.69s OpenComputers;
516fa8   4.23s Ender IO;
a651a8   4.08s IndustrialCraft 2;
5161a8   3.49s CraftTweaker2;
495797   7.37s CraftTweaker2 (Script Loading);
cd922c   3.37s NuclearCraft;
213664   2.65s Forestry;
a86e51   2.25s Extra Utilities 2;
ba3eb8   2.09s Cyclic;
308f7e   2.01s Quark: RotN Edition;
436e17   1.89s Integrated Dynamics;
3e8160   1.86s The Twilight Forest;
3eba85   1.79s Just Enough Magiculture;
3eb2ba   1.56s Botania;
8c2ccd   1.55s Immersive Engineering;
8f4d30   1.48s Open Terrain Generator;
649e21   1.40s OpenBlocks;
3e68ba   1.35s AE2 Unofficial Extended Life;
814a3e   1.31s RFTools;
61176e   1.26s Ice and Fire;
444444   9.88s 9 Other mods;
333333  37.04s 126 'Fast' mods (load 1.0s - 0.1s);
222222   7.79s 296 'Instant' mods (load %3C 0.1s)
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
Astral Sorcery      |  0.17|  0.00|  4.32|  0.52|  0.00|  0.00|  0.00|  0.00;
OpenComputers       |  0.14|  0.00|  3.07|  1.48|  0.00|  0.00|  0.00|  0.00;
Ender IO            |  1.27|  0.00|  2.78|  0.18|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2   |  0.71|  0.00|  2.92|  0.44|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2       |  0.65|  0.00|  2.83|  0.00|  0.00|  0.00|  0.00|  0.00;
NuclearCraft        |  1.23|  0.00|  1.96|  0.18|  0.00|  0.00|  0.00|  0.00;
Forestry            |  0.32|  0.00|  1.82|  0.51|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2   |  0.05|  0.00|  2.18|  0.02|  0.00|  0.00|  0.00|  0.00;
Cyclic              |  0.06|  0.00|  1.71|  0.32|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition |  0.02|  0.00|  1.93|  0.06|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics |  0.14|  0.00|  1.71|  0.03|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest |  0.62|  0.00|  1.12|  0.12|  0.00|  0.00|  0.00|  0.00
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
  2.15: jeresources.jei.JEIConfig;
  0.79: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.57: com.buuz135.industrial.jei.JEICustomPlugin;
  0.43: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.42: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.34: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.32: ic2.jeiIntegration.SubModule;
  0.26: nc.integration.jei.NCJEI;
  0.23: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.21: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.16: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.13: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.10: crafttweaker.mods.jei.JEIAddonPlugin;
  0.09: net.bdew.jeibees.BeesJEIPlugin;
  0.07: lach_01298.qmd.jei.QMDJEI;
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
            text: [147.74,'s'].join(''),
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
993A00   0.29s Loading sounds;
994400   0.32s Loading Resource - SoundHandler;
444444 147.14s Other
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

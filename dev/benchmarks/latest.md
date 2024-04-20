## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
393.22 sec
<br>
<sup><sub>(
6:33 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [146.14]},
      {label: 'FML stuff:', data: [247.07]}
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
8f3087  18.88s Forge Mod Loader;
516fa8   6.02s Ender IO;
8f304e   5.05s Astral Sorcery;
a651a8   4.81s IndustrialCraft 2;
cd922c   4.50s NuclearCraft;
3eba85   4.38s Just Enough Magiculture;
813e81   3.76s OpenComputers;
213664   3.17s Forestry;
5161a8   3.12s CraftTweaker2;
495797   9.09s CraftTweaker2 (Script Loading);
308f7e   2.37s Quark: RotN Edition;
649e21   2.28s OpenBlocks;
ba3eb8   2.26s Cyclic;
436e17   2.25s Integrated Dynamics;
3e8160   2.16s The Twilight Forest;
a86e51   2.01s Extra Utilities 2;
8451a8   1.98s LibrarianLib Stage 2;
8f4d30   1.84s Open Terrain Generator;
5a3d2c   1.81s Quark Oddities;
3eb2ba   1.81s Botania;
8c2ccd   1.62s Immersive Engineering;
444444  17.82s 14 Other mods;
333333  44.89s 142 'Fast' mods (load 1.0s - 0.1s);
222222   7.37s 269 'Instant' mods (load %3C 0.1s)
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
Ender IO                |  1.59|  0.00|  4.19|  0.24|  0.00|  0.00|  0.00|  0.00;
Astral Sorcery          |  0.15|  0.00|  4.31|  0.58|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2       |  0.56|  0.01|  3.62|  0.63|  0.00|  0.00|  0.00|  0.00;
NuclearCraft            |  2.02|  0.00|  2.28|  0.20|  0.00|  0.00|  0.00|  0.00;
Just Enough Magiculture |  0.12|  0.00|  0.00|  4.25|  0.00|  0.00|  0.00|  0.00;
OpenComputers           |  0.54|  0.01|  1.52|  1.69|  0.00|  0.00|  0.00|  0.00;
Forestry                |  0.27|  0.01|  2.50|  0.39|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2           |  0.45|  0.00|  2.67|  0.00|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition     |  0.02|  0.00|  2.29|  0.06|  0.00|  0.00|  0.00|  0.00;
OpenBlocks              |  0.16|  0.00|  2.09|  0.03|  0.00|  0.00|  0.00|  0.00;
Cyclic                  |  0.04|  0.00|  1.84|  0.37|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics     |  0.21|  0.00|  2.00|  0.04|  0.00|  0.00|  0.00|  0.00
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
  3.73: jeresources.jei.JEIConfig;
  1.15: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.67: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.51: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.50: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.46: com.buuz135.industrial.jei.JEICustomPlugin;
  0.33: ic2.jeiIntegration.SubModule;
  0.31: nc.integration.jei.NCJEI;
  0.25: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.24: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.22: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.17: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.11: lach_01298.qmd.jei.QMDJEI;
  0.10: net.bdew.jeibees.BeesJEIPlugin;
  0.09: crafttweaker.mods.jei.JEIAddonPlugin;
  1.31: Other 120 Plugins
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
            text: [247.07,'s'].join(''),
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
993A00   0.72s Loading sounds;
994400   0.76s Loading Resource - SoundHandler;
444444 245.59s Other
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

## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
293.54 sec
<br>
<sup><sub>(
4:53 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [107.02]},
      {label: 'FML stuff:', data: [186.52]}
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
813e81   4.94s OpenComputers;
a651a8   3.94s IndustrialCraft 2;
516fa8   3.93s Ender IO;
cd922c   3.58s NuclearCraft;
5161a8   2.68s CraftTweaker2;
495797   9.00s CraftTweaker2 (Script Loading);
213664   2.58s Forestry;
308f7e   2.03s Quark: RotN Edition;
3e8160   2.01s The Twilight Forest;
ba3eb8   2.01s Cyclic;
436e17   1.94s Integrated Dynamics;
3eba85   1.91s Just Enough Magiculture;
a86e51   1.83s Extra Utilities 2;
8f4d30   1.70s Open Terrain Generator;
3eb2ba   1.70s Botania;
8c2ccd   1.63s Immersive Engineering;
5a352c   1.47s Shadowfacts' Forgelin;
3e68ba   1.41s AE2 Unofficial Extended Life;
61176e   1.33s Ice and Fire;
814a3e   1.32s RFTools;
444444  12.56s 11 Other mods;
333333  37.69s 128 'Fast' mods (load 1.0s - 0.1s);
222222   7.82s 299 'Instant' mods (load %3C 0.1s)
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
Astral Sorcery          |  0.18|  0.00|  4.25|  0.58|  0.00|  0.00|  0.00|  0.00;
OpenComputers           |  0.14|  0.01|  3.23|  1.57|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2       |  0.56|  0.00|  2.95|  0.43|  0.00|  0.00|  0.00|  0.00;
Ender IO                |  1.31|  0.00|  2.43|  0.18|  0.00|  0.00|  0.00|  0.00;
NuclearCraft            |  1.27|  0.00|  2.09|  0.22|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2           |  0.11|  0.00|  2.57|  0.00|  0.00|  0.00|  0.00|  0.00;
Forestry                |  0.30|  0.00|  1.95|  0.33|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition     |  0.02|  0.00|  1.95|  0.06|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest     |  0.74|  0.00|  1.17|  0.10|  0.00|  0.00|  0.00|  0.00;
Cyclic                  |  0.05|  0.00|  1.59|  0.37|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics     |  0.15|  0.00|  1.76|  0.03|  0.00|  0.00|  0.00|  0.00;
Just Enough Magiculture |  0.10|  0.00|  0.00|  1.80|  0.00|  0.00|  0.00|  0.00
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
  2.84: jeresources.jei.JEIConfig;
  1.20: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.61: ic2.jeiIntegration.SubModule;
  0.50: com.buuz135.industrial.jei.JEICustomPlugin;
  0.49: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.48: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.31: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.30: nc.integration.jei.NCJEI;
  0.28: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.27: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.20: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.14: net.bdew.jeibees.BeesJEIPlugin;
  0.14: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.10: forestry.factory.recipes.jei.FactoryJeiPlugin;
  0.10: crafttweaker.mods.jei.JEIAddonPlugin;
  1.57: Other 124 Plugins
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
            text: [186.52,'s'].join(''),
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
444444 185.56s Other
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

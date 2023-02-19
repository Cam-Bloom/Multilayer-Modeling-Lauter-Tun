# Lauter Tun Depth Filteration 🍺
## Summary

The code models depth filtration through a lauter tun bed over time, taking in account of specific deposit and particle concentration, by using a number of measurements and co-efficents from derrived models.

This is an example of the output from the script:

![](Aspose.Words.4649f80e-fdd5-447b-b3cd-386a70a7da5e.003.png)


## Disertation Theory

A extraction from my disertation for the theory behind the MATLAB code

**2. Operating Principal** 

***2.1 Sizing estimation*2. Operating Principal** 

***2.1 Sizing estimation***

An estimation of size of lauter tun must be calculated, as vessel design affects size and shape of cake and therefore affects the process’. The vessel will be sized with ratios from a pre-existing technical drawing [2], with height to diameter of cylinder portion of design being 1:2, with 50% fill for maximum mash level. The conical top is 6:1 diameter to height ratio. 

***2.2 Sedimentation*** 

Sedimentation is the process of the slurry separating into a cake and wort via gravity. The time taken to reach this point is determined by the velocity of which the solid particles fall often called sedimentation velocity [3], this depends on 2 main forces firstly the force due to gravity and the drag force [4] created by the counter flow of liquid [3].

In the slurry a varied size of particles is observed, different sizes of particles affect Reynolds number this in-turn affects the drag force. At laminar flow (Re < 1 [5]) conditions Stokes Law can be utilized and at turbulent flow (103 < Re < 105 [5]) conditions the Drag Equation must be used. equations for all forces:

Fg=43πr3ρs-ρfg  Gravity 6  1         Fd=6πηrw  Stokes 6  2         

` `Fd=12ρw2CDA  Drag 6  (3)

The Stokes velocity is considered at the point that the particle experiences terminal velocity [1], this is the point in which the gravitational force is equal to the drag force, therefore equations can be developed for Stokes’s velocity at different Reynolds numbers:

w=RgD2C1ν  Stokes [5]  4        w= 4RgD3C2  Drag 5  (5)

Where C1 is a constant dependent on geometry equal to 18 for a perfect sphere, C2 is given as constant asymptotic value of the drag coefficient CD [5], The drag coefficient is a combination of multiple sources of drag and is almost always determined experimentally using a wind tunnel [4].

These models describe sedimentation in laminar and turbulent ranges but cannot describe in transitional range for which some particle would lie the transitional zone (1 < Re < 103), many graphs and empirical equations have been formed for this range including but not limited to Hallermeier (1981) for quartz in water and Ahrens (2000). However, equation by R.I Ferguson and M. Church (2004) is most appropriate due to it its performance against other methods and the ability for natural grain compensation [5]:

w=RgD2C1ν+0.75C2RgD30.5  (6)

This equation is useful as at low diameters it represents the viscous force of Stokes Law and at high diameter represents the Drag Equation. Constants C1 and C2 take values of 18 and 0.4 for smooth spheres [5]. However, solid particles in mash are natural shapes, in R.I Ferguson and M. Church study data was used for sand grains to determine optimum values of C1 and C2, it is assumed that the milled grains are geometrically like sand grains, due to diameter profiles being similar. R.I Ferguson and M. Church calculated the mean error and root mean error between experimental data with different particle sizes (0.068 mm to 4.36 mm) and several equations to model sedimentation, Tabulated and graphic results can be found in the appendix at 8.1. The model with lowest error was with R.I Ferguson and M. Church equation with constants C1 and C2 of values 18 and 1 respectively, this resulted in a mean error of -1 and root mean error of 6 both low relative to other equations.

Currently this model is based on a single particle isolated by itself with no interaction with other particles in the sedimentation process, it is known that this is not true as there are many particles in the slurry. There are hydrodynamic interactions between neighbouring particles because of this the settling velocity of the swarm is hindered. This is the fluid moving upwards to replace the particle as it settles (drag Force), this force affects neighbouring particles lowering velocity compared to an isolated particle [7] an illustration of this phenomenon can be found in appendix at 8.2. There are many models to correct for this behaviour most notably the linear relationship by Batchelor and modified models power relationship of Richard and Zaki, the issue with these models for lauter tun application is that particle volume fraction ϕ in mash is relatively high at approximately 0.41 for this case, limits for Batchelor ϕ < 0.05 [7] and for many power model’s velocity becomes negative for  ϕ > 0.27. Therefore, a model that accommodates high concentrations must be used, Brady and Durlofsky used the Ronte-Prager approximation to derive an expression suitable from dilute systems to close packing [8]:

Uw0=1+ϕ-15ϕ2-65ϕ5-ϕ+12ϕ21+2ϕ (7)

The time for sedimentation is given the distance a particle must travel divided by the sedimentation velocity U:

t=hU     (8)

Due to difference in particles sizes, the total time for full sedimentation is given by the particle which takes the longest to deposit, from the equation above we can see this would be given by the maximum height of the mash with the lowest velocity which is proportional to the lowest diameter particle. 

As a low diameter particle is used to calculate lowest velocity, stokes law may be valid, however this is rejected as stokes law is calculated using a smooth sphere, R.I Ferguson and M. Church equation incorporates natural particle geometry into equation.

Limitations of this developed model is that it does not consider wall effect on sedimentation however it is assumed to be negligible due to the diameter of particles compare to the diameter of vessel being small [7] this can be proven by as d/D tends to zero in Francis’ equation [9]:

UU0=1-d/D1-0.475d/D4    (9)

***2.3 Filtration***

Cake filtration is a process when a contaminated liquid stream is passed through a bed of solid particles, the particles in the liquid stream get trapped in the bed producing a reduction in contamination.

A filter cake has now been formed, flow through this bed can be described as a packed bed of solid particles with regular pores [3]. This is governed by Darcy’s law:

u=ΔPηR   (10)     where R=LK

Velocity through pores can also be described via the filtrate volume per unit time and per unit area:

u=1AdVdt     (11)

Combining with Darcy’s Law:

dVdt= ΔPAηR     (12)

Resistance R is traditionally split into individual resistances of the cake and the medium, however in the case of lautering the medium provides negligible resistance compared to the cake and therefore can be ignored [3]. Cake resistance will increase throughout the filtration run as additional material settles on top of the cake, this can be defined by the specific resistance of the cake and mass of cake deposited per unit area [3]:

R=αWA (13)   where W= ρs1-msV=cV

Subsisting into equation 12:

dVdt=ΔPA2ηαcV    (14)

When the pressure difference is assumed to be constant the equation above can be integrated with α, A and c constant then rearranging for time:

t=ηαc2ΔPA2V2     (15)

The Darcy’s law derivation allows for a determination of the time taken for a filtration pass to happen. In real filtration not every particle is going to travel through, nor block a pore, there is several models that exist to describe each type of blocking, it is given by the generalized form [10].

d2tdV2=const∙dtdVq    (16)

Where exponent q determines extent of blocking 0 for cake filtration slow blocking, 1 for intermediate filtration, 3/2 for standard blocking filtration and 2 for complete blocking [10]. As mentioned above in the lauter tun it is not expected that every particle blocks a pore. Therefore, a partial blocking model has to be considered.

Depth filtration is a standard blocking model which is generally used for filtrations with a coarse grain bed of larger particles that the filtrate [10]. This model fits the application of the lauter tun, this is due to after sedimentation the larger particles form the cake while some smaller particles travel through and contaminate the wort. An image in appendix at 8.3 shows which separation methods work best at with different particle sizes.

***2.4.1 Depth Filtration*** 

If a system has a bed diameter much greater than the granular diameter, it can be assumed that radial flow and therefore mass transfer is negligible and can be ignored [[11], this allows for a one-dimensional conservation of mass to be written as [11]:

-usdCdz+Dd2Cdz2=ddtεC+dσdt     (17)

dσdt is often defined as filtration rate, it is normally written as a generic function N [11] which is a function of concentration, specific deposit and a collection of other parameters α:

N=dσdt=Nα,C,σ      (18)

It is assumed that diffusive mass transfer in the axial direction is negligible therefore it is ignored and then conservation equation can be reduced [11]:

usdCdz+ddtεC+σ=0     (19)

Customary practice to define a corrected time variable to be able to write conservation of mass in original form [11] as per Tien [12]:

θ=t-0Zεusdz    (20)

With the application of chain rule to equation 19, and then rearranging the following equation is developed [11]:

usdCdz+1-C1-εddσdθ=0     (21)

The following approximation can be made, due the size of C being much lower than 1 [11]:

1-C1-εd≈1     =>   usdCdz+dσdθ=0     (22)

For an initial clean bed, the initial and boundary conditions are as follows [12]:

C=0    σ=0      for     z≥0     θ≤0C=Cin      at     z=0     θ>0

In 1937 Iwasaski shown from his experimental data that concentration profile through a filter can be described by logarithmic law [12]:

dCdz=-λC    (23)    sub in to 22    dσdθ=λusC     (24)

Where lambda is defined as the filter coefficient, lambda only has logarithmic behaviour during initial filtration period [12], lambda can be expressed by initial value times by function F which is a function of α and σ, over the years there has been many models to describe this behaviour notably Iwasaki (1937), Mehter et al (1970), Mackrle et al. (1965) and Ives (1960 and 1969) [12].

λ=λ0Fα,σ    (25)

Equation 22 and 18 are a set of partial differential equations, they can be solved by multiple different methods however most methods are complex. These partial differential equations can be solved by the method by Herzig et al (1970) [13] [12], by making a pair of equivalent ordinary differential equations, these could be then solved sequentially instead of simultaneously, the following derivation is from Granular Filtration of Aerosols and Hydrosols section 2.4[12]. Herzig applied the conversation principal to bed with height z and over a time 0 to t, given that the number of particles at z = 0 from time 0 to t has to be equal to the number of particles at z = Z for time 0 to t plus the number of particles retained in the filter from distance 0 to Z this develops the following:

0tusCin dt=0tusCZ,t dt+0zσ+εC dz    (26) 

The following equation can be expressed by combining equations 24 and 25:

N=dσdθ=λ0Fα,σusC     (27)

Which then can be transformed by choosing arbitrary values of time t and axial distance Z:

CZ,t=1λ0Fα,σ(Z,t)usdσdθ      (28)

Because specific deposit is a function of both time and axial distance the following can be written:

dσ=dσdtzdt+dσdztdz          at z=Z  dσ=dσdtzdt     (29)    

Using equations 26 and 29, the function C (Z, t) can now be replaced in equation x:

0tusCin dt=0σ(Z,t)usdσ(Z,t)λ0Fα,σ(Z,t)+0zσ+εC dz    (30)

In the equation above the function F is a function of specific deposit which is dependent on z and t. Leibnitz’s rule is then applied:0=1λ0Fα,σdσdzt+σ+εC         =>      -dσdzt=λ0Fα,σ∙σ+εC   (31)  

Independent variables z and θ are used instead of z and t, and then equation 18 is substituted in, this produces a solvable ODE for what happens along the filter height for any specific time:

dσdzθ=-λ0Fα,σσ    (32) 

Another ODE can be developed describing what is happening at the filter inlet z = 0 by denoting σ as σin:

dσindθ=usλ0Fα,σCin    (33)             Inital conditions    σin=0  at  θ=0

Using equation 31 allows for determination of specific deposit at the inlet as a function of time constant, then the profile for specific deposit over the length of the cake can be found for any given time solving equation 32 with the specific deposit at the inlet. Herzig further went to describe a formula describing particle concentration this is given by [12]:

CCin=σσin      (34)

Now ODEs 31 and 32 can be solved using a computer code, in conjunction with equation 34 to make a model which describes filtration for any cake given starting parameters.

***2.4.2 Clogging function F*** 

The function F describes how the efficiency of the filter coefficient changes with specific deposit, there are several models to describe this, ranging from single coefficient scaling of specific deposit as such in Iwasaki (1937) [11] to models which incorporate multiple coefficients based on a number of different parameters such as Ives (1969) [11]. An adaptation of Ives 1969 general model was done by E. Mohanka (1971) [14] when studying multi-layer filters. It is given by:

F=λλ0=1+bσε0y1-σε0z1-σσux      (35)

Where    b=29s0.65    σu=ε1+us0.75   y=1.5   z=0.75   x=0.45S0.61us0.24     (36)

An experiment could be carried out with a pilot lauter tun recording the particle concentration of output vs input this would allow for data fitting to the best clogging function F [11].

***2.4.3 Filter coefficient***

The filter coefficient of the initial bed without contamination is one of the key input parameters for this model, it can be estimated using the following equation [14]:

λ0=1.145∙S1.35us0.25      (37)

S is the specific surface in 1/mm, it is estimated by the following equation [14]:

S=6(1-ε0)dg    (38)

***2.5 Sparging***

It is known that after filtration 50% of the sugars are still retained in the filter bed [3]. The washing of the cake is split into 2 main phases the first where the filtrate is hydraulically displaced the second stage is dominated by mass transfer mechanisms [3], Wakeman (1981) stated the following fundamental mechanism, internal diffusion, transfer to liquid in pores of solid, diffusion in micropores, diffusion in liquid and eddy mixing [3]. Since 1980s the dispersion has be one model which most washing curve literature has used [15], Wakeman gave the model as [15]:

ce-cwc0-cw=1-12erfc1-WR2WRDn+exp Dn erfc1+WR2WRDn     (39)

where    Dn=ReScCLdpDDL

The relationship between molecular diffusion coefficient and the axial dispersion diffusion coefficient can be given for cakes height taller than 10cm, this assumes the particle are large and regular, the relationship is as follows [15]:

DLD=0.707+1.75ReScp     (40)

The molecular diffusion coefficient can be determined at a given temperature by the following equation [54] where A and B are constants:

log10D=A+BT    (41)    where A= -1.987 and B=-950

**3. Unit Operation Design** 

***3.1 Basis of calculations***

The basis of calculations is given by the input from the mash tun on super pro, during preliminary plant design of M1. All calculations that are not simply carried out will be coded either using excel or MATLAB. The input stream can be defined as follows [16]:

*Table 1: Inlet basis from M1*

|**Component**|**Water**|**Glucose**|**Dextrose**|**Starch**|**Fats**|**Fibres**|**Minerals**|**Proteins**|
| :- | :- | :- | :- | :- | :- | :- | :- | :- |
|**Mass (Kg)**|3856.539|1511.878|206.165|662.096|63.057|252.227|31.528|346.812|

***3.2 Sizing Calculations***

With a density of barley of 1130 kg m-3 [17] and water of 1000 kg m-3 the inlet volume of the slurry can be calculated from mass flow = 6.577 m3. It is given that height to diameter ratio is 1:2 with 50% working volume therefore ratio designing for max height of slurry to diameter is 1:4.

D4=hc       V=Ahc           V= πD24D4=πD316            D=316Vπ

D=316∙6.577 m3π=3.223m       hslurry= 3.223 m4=0.806 m    h=1.612 m

hCake=2.721 m3π3.324=0.318 m

The diameter and height will be rounded up to the nearest 0.1 m for ease of manufacturing, this gives diameter as 3.3 m and height of cylinder of 1.7 m. 

The conical shell is constructed with a diameter to height ratio of 6:1 ratio, this produces a cone with height 0.55 m

***3.3 Particle Size Distribution***

In milled barley particles range in size approximately from a 5 μm to 4mm. In literature there are many graphs describing this distribution but no raw data, therefore a graph must be interpreted to get usable quantitative data. A histogram was chosen over a line graph as it is easier to interpreted therefore reducing errors. T.M. Buhler provides a distribution as part of his thesis [2] a figure can be found in appendix at 8.4, this histogram is hard to work with due to different sized bins, as area is the key parameter. The smaller bins were averaged and grouped together due to difficulty providing accurate measurements, height and width of each bin was taken then the area was normalized to give a percentile distribution for each bin, each bin was then split up into 200 μm steps, and percentile divided by number of steps. Excel tables can be found in the appendix at 8.5. This gives a percentage for each averaged particle size.

![](Aspose.Words.4649f80e-fdd5-447b-b3cd-386a70a7da5e.001.png)

*Figure 1: Particle size distribution of milled barley.*

***3.4 Sedimentation Calculations***

The theory of sedimentation was outlined above, now a particle distribution has been defined the time of sedimentation can be calculated. As settling velocity is a function of particle diameter different sized particles will settle at different rates, an example calculation for 100 μm particle, full table of calculations can be found in appendix at 8.5:

w=RgD2C1ν+0.75C2RgD30.5=0.13∙9.81∙0.0001218∙1×10-6+0.75∙1∙0.13∙9.81∙0.000130.5=0.000672 ms-1

Uw=1+ϕ-15ϕ2-65ϕ5-ϕ+12ϕ21+2ϕ=1+0.414-15∙0.4142-65∙0.4145-0.414+12∙0.41421+2∙0.414=0.110

U=0.110∙w=0.110∙0.000672 ms-1=0.0000741 ms-1 

t=hU=0.809 m0.0000741 ms-1 =10871.250 s≈181 mins

This example gives a particularly high answer due to the small size of particle and square relationship between velocity and diameter at low diameters. This time of 181 minutes is for longest possible settling time, in practice this time would not be acceptable as it would become a bottleneck, because of this a compromise between sedimentation performance and time must be made, reducing the time increases particles in wort and therefore turbidity which is a performance parameter of the next process. 

![](Aspose.Words.4649f80e-fdd5-447b-b3cd-386a70a7da5e.002.png)

*Figure 2: Percentage deposition of particles vs time*

It can observe by figure 2, that it is inefficient to allow all particles to sediment fully therefore a compromise between performance and time must be made, if a lower time is used to sediment the wort from first run off will be slightly more contaminated with solid particles meaning a higher amount of filtration will be needed to achieve an acceptable of turbidity.

From figure 2 it can be seen that above 15 minutes 96.5% of particles have been deposited and there are demonising returns for a sedimentation time for longer than this. It is assumed that all particles not sedimented are carried in the first run off. When the particles are originally settling some of the particles will travel through the false bottom, it is given that the slot on the false bottom are of 1 mm, therefore it is assumed that 50 % of particles smaller than 1mm are carried out in the first run off. Combining these to sources of contaminants produces 3.5% + 7.2% = 10.7 % contamination of solid particles in the first run off.

***3.5 Filtration Calculations*** 

Theory of filtration time derived from Darcy’s law is outlined above, relating time to various resistance parameters and filtration volume:

t=ηαc2ΔPA2V2=K12V2

Bocketstal et al (1895) carried experiments for the determination of K1 with milled grist, with an area of 0.0002 m2 it is assumed that the relationship between resistance parameters and area are linearly proportional with only constant being viscosity therefore each value will be scaled using area. Typical values obtained in his experiment are as follows [3]:

K12=ηαc2ΔPA2=4000 s m-6      A2A1=  π3.324m20.002 m2=4275    

K22=4000 s m-6∙4275∙42754275∙42752=0.936 s m-6

Now the resistance K has been determined the time taken for the filtrations can be calculated:

t=ηαc2ΔPA2V2=0.936 s m-6∙3.856  m32=13.916 s≈14

This is a relatively low filtration time however after the wort has filtered through the cake it is funnelled into a runoff pipe this pipe has a small diameter compared with the lauter tun because of this it becomes an additional resistance to the time. The time taken is given by Torricelli's law [18]:

t=ACA02Hg   C=0.61      =>     t=π3300240.61∙π100242∙0.4519.806=541.446 s

This gives a total time of 555.362 s or 9.3 minutes.

***3.6 Depth filtration*** 

The theory for depth filtration was set out in the preceding section, 2 partial differential equations were transformed into 2 ordinary differential equations which are used to model the filtration of the system. The model considers a single type of particle so therefore the system will be assumed to fit this. The solid particles will be assumed to have the equal selectivity to the bed.

These ODEs are most easily solved using code, this will be done on MATLAB, the code will first set out the initial parameters of the cake such as height, average bed grain size, filtration time, concentration and porosity of the bed, from this additional parameter such as specific surface, velocity and initial filtration coefficient using equations 31 and 32. The time and height will now be split into equal amounts of steps to allow matrices to be of same size and therefore transformable. The calculation is now ready to happen it will work by solving each ODE sequentially, both will be solved with function ‘ode45’ which is based on a 4th order form of the Runge Kutta numerical method. The first ODE to be solved is equation 31, a corresponding function is created then initial conditions of σ0 and from time 0 to t. Once this is solved for σin, the next ODE equation32 can be solved in the same way creating a corresponding function with initial condition of σin over the height of the bed, when solved this creates a profile of specific deposit over height of bed for any given time. For the ODEs to be solved another function of the clogging effect F needs to be created, any parameters that need to be calculated are done inside the function. Now that both σin and σ is known the concentration profile can also be calculated with equation 34, but first σin has to be transposed so it is in right orientation for calculation. Full commented code can be found in the appendix at 8.6.

The main design objective of the filtration stage was to achieve an acceptable level of turbidity, Englmann and Wasmuth (1993) [19] stated that 200 mg/l is described as hazy lautering and normal brewhouses to aim for 40 mg/l [19].

As mentioned above there are 4 initial conditions needed for the code to run these are as follows: Cake height was calculated in preceding section as h=0.318 m. Average grain size of bed is calculated by taking average of size of all particles above slot size 1 mm. This was completed in excel using the particle size distribution in the preceding section. This gave a value of dg=2.514 mm. Filtration time was calculated in preceding section as t≈14 s. Concentration is given by the number of particles in wort after sedimentation divided by the volume of wort liquid this gives a concentration of 0.043 kg dm-3. Porosity of a lautering filter cake was found to be ε=0.583 via x-ray microtomography [20].![](Aspose.Words.4649f80e-fdd5-447b-b3cd-386a70a7da5e.003.png)

*Figure 3: Specific deposit profile and concentration profile first recirculation*

` `The figure above was created via the code, first looking at the specific deposit profile, it can be observed that most of the deposit is near the top of the cake mainly up to a depth of 0.10 m, this is consistent with brewing practice as it is known in filtration an additional layer of fine particles is deposited near the top of the cake [21]. From looking at the second profile of concentration it can be seen at the exit of the cake the concentration is initially high but falls due to changes in function F, as the flowrate is considered to be constant throughout the concentration at each time step can be averaged to get the concentration of the first run off. The first run off gave a particle concentration of 6012.114 mg/l this is still far above standards even for hazy lautering therefore another recirculation will have to be carried out. For the second recirculation the Cin becomes 0.00601 kg dm-3 and the σ0 becomes the deposit at inlet at tend, σ0= 0.308m3m3. The code is then repeated:![](Aspose.Words.4649f80e-fdd5-447b-b3cd-386a70a7da5e.004.png)

*Figure 4: Specific deposit profile and concentration profile second recirculation*

From this figure it can be seen that there is little change to specific deposit over time this is due to the concentration of contaminants now being small and therefore less deposition. Because of the little change in deposition function F remains relatively constant, therefore the concentration profile is a more linear shape compared to first run off, particle concentration was worked out in the same way as before giving a value of 128.728 mg/l this is in between the value for hazy lautering and normal lautering. A brewer would have to consulted to see if this is an allowable turbidity for the colour and flavour profile. A third recirculation could be preformed this would reduce the particle concentration to 2.511 mg/l, the rakes could be activated during the third recirculation to bring the particle concentring to 40 mg/l. The brewer would make final decision on number of recirculation’s however preliminary 2 recirculation’s will be used.


# Generated by PySCeS 0.9.0 (2017-06-22 14:45)
 
# Keywords
Description: Kollarovic2016 - Cell fate decision at G1-S transition
Modelname: MODEL1505080000
Output_In_Conc: True
Species_In_Conc: True
 
# GlobalUnitDefinitions
UnitVolume: litre, 1.0, -6, 1
UnitLength: metre, 1.0, 0, 1
UnitSubstance: mole, 1.0, -6, 1
UnitArea: metre, 1.0, 0, 2
UnitTime: second, 3600.0, 0, 1
 
FIX: DDR 
 
# Compartments
Compartment: compartment, 1.0, 3 
 
# Function definitions
Function: Constant_flux__irreversible_0, v  {
v
}
Function: mod_1__CF_2, p53 , va5_k_0  {
va5_k_0*p53
}
Function: mod_1__CF_1, DDR , va3_k_0  {
va3_k_0*DDR
}
Function: pos__FB_inh_MA_1, CycECdk2 , CycECdk2a , p21 , vb1_Ki_0 , vb1_Kma_0 , vb1_Kmb_0 , vb1_h_0 , vb1_k0_0 , vb1_k1_0 , vb1_ka_0 , vb1_kb_0  {
CycECdk2*(vb1_k0_0+vb1_k1_0*2.0*vb1_ka_0*CycECdk2a*vb1_Kmb_0/(vb1_kb_0-vb1_ka_0*CycECdk2a+vb1_kb_0*vb1_Kma_0+vb1_ka_0*CycECdk2a*vb1_Kmb_0+pow(pow(vb1_kb_0-vb1_ka_0*CycECdk2a+vb1_kb_0*vb1_Kma_0+vb1_ka_0*CycECdk2a*vb1_Kmb_0,2.0)-4.0*(vb1_kb_0-vb1_ka_0*CycECdk2a)*vb1_ka_0*CycECdk2a*vb1_Kmb_0,1.0/2.0)))/(1.0+pow(vb1_Ki_0*p21,vb1_h_0))
}
 
# Reactions
va1@compartment:
    DNADamageS > $pool
    compartment*va1_k1*DNADamageS
# va1 has modifier(s): DNADamageS  

vb3@compartment:
    $pool > Cdk2
    compartment*Constant_flux__irreversible_0(vb3_v_0)

vb2@compartment:
    CycECdk2a > CycECdk2
    compartment*k2b*CycECdk2a
# vb2 has modifier(s): CycECdk2a  

vb1@compartment:
    CycECdk2 > CycECdk2a
    compartment*pos__FB_inh_MA_1(CycECdk2,CycECdk2a,p21,vb1_Ki_0,vb1_Kma_0,vb1_Kmb_0,vb1_h_0,vb1_k0_0,vb1_k1_0,vb1_ka_0,vb1_kb_0)
# vb1 has modifier(s): p21 CycECdk2 p21 CycECdk2a  

vb7@compartment:
    CycE + Cdk2 > CycECdk2
    compartment*vb7_k1_0*CycE*Cdk2
# vb7 has modifier(s): CycE Cdk2  

vb6@compartment:
    CycE > $pool
    compartment*k6b*CycE
# vb6 has modifier(s): CycE  

vb5@compartment:
    $pool > CycE
    compartment*Constant_flux__irreversible_0(vb5_v_0)

vb4@compartment:
    Cdk2 > $pool
    compartment*k4b*Cdk2
# vb4 has modifier(s): Cdk2  

va2@compartment:
    DNADamageC > $pool
    compartment*va2_k1*DNADamageC
# va2 has modifier(s): DNADamageC  

va3@compartment:
    $pool > p53
    compartment*mod_1__CF_1(DDR,va3_k_0)
# va3 has modifier(s): DDR DDR  

vb8@compartment:
    CycECdk2 > CycE + Cdk2
    compartment*k8b*CycECdk2
# vb8 has modifier(s): CycECdk2  

va6@compartment:
    p21 > $pool
    compartment*k6a*p21
# va6 has modifier(s): p21  

va4@compartment:
    p53 > $pool
    compartment*k4a*p53
# va4 has modifier(s): p53  

va5@compartment:
    $pool > p21
    compartment*mod_1__CF_2(p53,va5_k_0)
# va5 has modifier(s): p53 p53  
 
# Assignment rules
!F Fit_Cdk2_T = (Cdk2+CycECdk2+CycECdk2a)/(Metabolite_3_0+Metabolite_5_0+Metabolite_7_0)
!F Fit_Cdk2a = CycECdk2a/Metabolite_7_0
!F Fit_CycE_T = (CycECdk2+CycECdk2a+CycE)/(Metabolite_5_0+Metabolite_7_0+Metabolite_1_0)
!F Cdk2_T = Cdk2+CycECdk2+CycECdk2a
!F CycE_T = CycECdk2+CycECdk2a+CycE
!F Fit_Cdk2_Thr160 = (CycECdk2+CycECdk2a)/(Metabolite_5_0+Metabolite_7_0)
!F Cdk2_Thr160 = CycECdk2+CycECdk2a
!F DNAdamagefoci_0 = Gy*FociPerGy
!F DDR = BaseDNAdamage+DNADamageC+DNADamageS+TAF
 
# Event definitions
Event: DNADamage, operator.gt(_TIME_,0.0), 0 
{
DNADamageC = prop_C * DNAdamagefoci_0
TAF = ModelValue_9_0 + k_TAF * pow(Gy, 1 / 2)
DNADamageS = (1 - prop_C) * DNAdamagefoci_0
}
 
# Fixed species
DDR@compartment = 2.666908
 
# Variable species
Cdk2@compartment = 0.0166736
p21@compartment = 1.0
CycECdk2a@compartment = 2.28154
DNADamageS@compartment = 0.0
CycE@compartment = 9.21798135383
DNADamageC@compartment = 0.0
CycECdk2@compartment = 1.36697471607
p53@compartment = 1.0
 
# Parameters
va1_k1 = 0.234805
vb3_v_0 = 99.84
k2b = 2.43594662809
vb1_Ki_0 = 0.394586
vb1_Kma_0 = 0.001143917344
vb1_Kmb_0 = 0.00842472
vb1_h_0 = 4.93142
vb1_k0_0 = 0.10249
vb1_k1_0 = 4.00486
vb1_ka_0 = $$gauss(3.40431,1.2)$$
vb1_kb_0 = 0.324616
vb7_k1_0 = 10.0
k6b = 1.08476678528
vb5_v_0 = 9.99936
k4b = 5987.90902984
va2_k1 = 0.0164994
va3_k_0 = 0.00547468
k8b = 1.12435827887
k6a = 193.258
k4a = 0.0146004678894
va5_k_0 = 193.258
k_TAF = 0.973822
Cdk2_0 = 0.0166736
Fit_Cdk2_T = 1.0	# (rule)
Fit_Cdk2a = 1.0	# (rule)
Fit_CycE_T = 1.0	# (rule)
prop_C = 0.0905648
ModelValue_9_0 = 0.506228
Cdk2_T = 3.66518831607	# (rule)
BaseDNAdamage = 2.16068
Metabolite_3_0 = 0.0166736
TAF = 0.506228
CycE_T = 12.8664960699	# (rule)
Fit_Cdk2_Thr160 = 1.0	# (rule)
Metabolite_1_0 = 9.21798135383
Metabolite_7_0 = 2.28154
Cdk2_Thr160 = 3.64851471607	# (rule)
CycE_0 = 9.21798135383
Metabolite_5_0 = 1.36697471607
Gy = 0.0
DNAdamagefoci_0 = 0.0	# (rule)
FociPerGy = 28.9678
CycECdk2_0 = 1.36697471607
CycECdk2a_0 = 2.28154
 

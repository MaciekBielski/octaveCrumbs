#! /usr/bin/octave -qf
clear all;
close all;
format long;
setenv("GNUTERM", "wxt");

fp_otdr = "otdr.csv";
fp_laser = "laser.m";
# data1 = csvread(fp_otdr);
# data1 = data1(13:end , :);
# 
# xt = data1(827-13:4370-13 ,1);
# yt = data1(827-13:4370-13 ,2)-data1(8000,2);
# 
# yt_log = 0.5 * log10(yt ./ yt(1));
# xt = xt .- xt(1);
# # n = 1.4
# xt = xt.*(3e8/2800);
# plot(xt,yt_log)
# 
# xlabel "L [km]"
# ylabel "P_{wzgl} [dB]"

#####

# temp = [10, 20, 30, 40, 50];
# lambda = [1557.81, 1558.82, 1560.26, 1561.64, 1562.7];
# cfs = polyfit(temp, lambda,1);
# lambda_app = polyval(cfs, temp);
# plot(temp, lambda, temp, lambda_app)

data2 = dlmread(fp_laser);
# prad w mA
# napiecie w V
# moc w W

i1 = data2(3:103);
u1 = data2(109:209);
p1 = data2(215:315);

i2 = data2(321:421);
u2 = data2(427:527);
p2 = data2(533:633);

i3 = data2(639:739);
u3 = data2(745:845);
p3 = data2(851:951);

i4 = data2(957:1057);
u4 = data2(1063:1163);
p4 = data2(1169:1269);

cfs1 = polyfit(i1(30:end),p1(30:end),1);
pf1 = polyval(cfs1, i1);
cfs2 = polyfit(i2(30:end),p2(30:end),1);
pf2 = polyval(cfs2, i2);
cfs3 = polyfit(i3(30:end),p3(30:end),1);
pf3 = polyval(cfs3, i3);
cfs4 = polyfit(i4(30:end),p4(30:end),1);
pf4 = polyval(cfs4, i4);
plot(i1, p1, i2, p2, i3, p3, i4, p4)

Ith = [];
for cfs = [cfs1; cfs2; cfs3; cfs4]'
    Ith = [Ith; (-1)*cfs(2)/cfs(1)];
end;

Ith
log(0.6*Ith)

pause;

library("DiagrammeR")
library("rsvg")
library("DiagrammeRsvg")

flow <- grViz("
digraph engagement_tree {

# node definitions with substituted label text
node [fontname = Helvetica, shape = rectangle]
a [label = '@@1', style = filled, fillcolor = AntiqueWhite]
b [label = '@@2']
c [label = '@@3']
d [label = '@@4', style = filled, fillcolor = AntiqueWhite]
e [label = '@@5']
f [label = '@@6']
g [label = '@@7', style = filled, fillcolor = AntiqueWhite]
h [label = '@@8']
i [label = '@@9']
j [label = '@@10', style = filled, fillcolor = AntiqueWhite]
k [label = '@@11']
l [label = '@@12']
m [label = '@@13', style = filled, fillcolor = AntiqueWhite]
n [label = '@@14']
o [label = '@@15']
p [label = '@@16', style = filled, fillcolor = AntiqueWhite]
q [label = '@@17']
r [label = '@@18']
s [label = '@@19', style = filled, fillcolor = AntiqueWhite]
t [label = '@@20']
u [label = '@@21']
v [label = '@@22', style = filled, fillcolor = AntiqueWhite]
w [label = '@@23']
x [label = '@@24']
y [label = '@@25', style = filled, fillcolor = AntiqueWhite]
z [label = '@@26']
ab [label = '@@27']
ac [label = '@@28', style = filled, fillcolor = Gainsboro]
ad [label = '@@29', style = filled, fillcolor = Gainsboro]
ae [label = '@@30', style = filled, fillcolor = Gainsboro]
af [label = '@@31', style = filled, fillcolor = Gainsboro]
ag [label = '@@32', style = filled, fillcolor = AntiqueWhite]
ah [label = '@@33']
ai [label = '@@34']
aj [label = '@@35', style = filled, fillcolor = Gainsboro]

# edge definitions with the node IDs
a -> b
a -> c
c -> d
d -> e
d -> f
f -> g
g -> h
g -> i
h -> s
i -> m
j -> k
j -> l
m -> n
m -> o
o -> y
n -> p
p -> q
p -> r
r -> y
q -> s
s -> t
s -> u
u -> y
t -> v
v -> w
v -> x
y -> z
y -> ab
z -> af
b -> v
k -> ae
e -> s
w -> ac
ab -> j
l -> ag
ag -> ah
ag -> ai
ah -> ad
ai -> aj
x -> aj
}

[1]: 'Does the government or a donor wish to fund \\n a programme of local university engagement activity?'
[2]: 'Yes'
[3]: 'No'
[4]: 'Does the central university administration \\n encourage local engagement?'
[5]: 'Yes'
[6]: 'No'
[7]: 'Do communities, local businesses, local government \\n or city hall want to work with the university?'
[8]: 'Yes'
[9]: 'No'
[10]: 'Do staff ‘moonlight’ by doing \\n additional work outside the university?'
[11]: 'Yes'
[12]: 'No'
[13]: 'Is the university decentralised? (Do faculties and departments \\n have significant decision making powers/budgets?)'
[14]: 'Yes'
[15]: 'No'
[16]: 'Do faculties/departments want to do this work?'
[17]: 'Yes'
[18]: 'No'
[19]: 'Is there funding/resources available for this work? \\n e.g. university budgets, government support, ministry or city hall project funding,\\n unallocated donor support (including block or ‘bottom-up’ funding)'
[20]: 'Yes'
[21]: 'No'
[22]: 'Do key academics, researchers, staff etc want to do this work?'
[23]: 'Yes'
[24]: 'No'
[25]: 'Do key academics, researchers, staff etc want to do this work without\\n dedicated funding or incentives? (e.g. for altruistic reasons)'
[26]: 'Yes'
[27]: 'No'
[28]: 'Outcome: the engagement process begins'
[29]: 'Outcome: university may consult and work locally \\n as a tangential effect of national or international activity'
[30]: 'Outcome: individual academics may work locally \\n as part of ‘moonlighting’ assignments outside of their day job'
[31]: 'Outcome: the engagement process begins \\n but with scale and sustainability concerns'
[32]: 'Is there a programme of nationally- or \\n internationally-focused engagement activity at the university?'
[33]: 'Yes'
[34]: 'No'
[35]: 'Outcome: no programme of \\n local engagement activity takes place'
")

flow2 <- export_svg(flow)
flow3 <- charToRaw(flow2)
rsvg_pdf(flow3, "Local engagement decision tree.pdf")
rsvg_png(flow3, "Local engagement decision tree.png")
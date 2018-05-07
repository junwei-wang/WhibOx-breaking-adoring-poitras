# Breaking *Adoring Poitras*

*Adoring Poitras* is the winning white-box implementation of AES-128 from
[**WhibOx contest**](https://whibox-contest.github.io/), also known as **CHES
2017 CTF**.  We released a [white-paper](https://eprint.iacr.org/2018/098) on
breaking it at IACR ePrint archive.  The original source code can be found
[here](https://whibox-contest.github.io/show/candidate/777).

This repository provides some intermediate results and tools of our analysis
on *Adoring Poitras*.

## Evaluation Environment

The reference environment (OS and compiler) of **WhibOx** contest can be found
from [their rules](https://whibox-contest.github.io/rules.html).  Our
experiments is done with GCC 7.2.0_1 on iMac (27-inch, Late 2012).

### Other Requirement

In order to open `*.cdf`, you may need to install [Wolfram CDF
Player](https://www.wolfram.com/cdf-player/).

## Intermediate Results and Related Tools

### Reverse Engineering

- [reverse-engineering/step1-readability.c](reverse-engineering/step1-readability.c):
  result after readability prcessing.
- [reverse-engineering/step2-de-virtualization.c](reverse-engineering/step2-de-virtualization.c):
  result after removing the virtual machine.
- [reverse-engineering/step3-simplification.c](reverse-engineering/step3-simplification.c):
  code after simplification.
- [reverse-engineering/step4-ssa.c](reverse-engineering/step4-ssa.c): code after
  single static assignment transformation.
- [reverse-engineering/step5-circuit-minimization.c](reverse-engineering/step5-circuit-minimization.c):
  code after circuit minimization.

### Data Dependency Analysis

1. `python ddg/extract_dag_edges.py > ddg/edges.txt` to generate edges in the data
   dependency graph of the minimized circuits.
2. [ddg/ddg-clustering.cdf](ddg/ddg-clustering.cdf) is the illustration of our
   data dependency analysis and clustering analysis.

### Linear Decoding Analysis (LDA)

[lda/lda.cdf](lda/lda.cdf) is an illustration of our linear decoding analysis for the 5th
s-box.

## Publication
```
@misc{cryptoeprint:2018:098,
    author = {Louis Goubin and Pascal Paillier and Matthieu Rivain and Junwei Wang},
    title = {How to Reveal the Secrets of an Obscure White-Box Implementation},
    howpublished = {Cryptology ePrint Archive, Report 2018/098},
    year = {2018},
    note = {\url{https://eprint.iacr.org/2018/098}},
}
```

## License

All the C source codes carry the same license as the submission 777 in
**WhibOx** contest.

[ddg/ddg-clustering.cdf](ddg/ddg-clustering.cdf) and [lda/lda.cdf](lda/lda.cdf)
and the other files are [CC BY-SA
3.0](https://creativecommons.org/licenses/by-sa/3.0/) licensed.

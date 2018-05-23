# asprilo Encodings

## About

This is a collection of encodings for [asprilo](https://potassco.org/asprilo).

## Directory Structure

The encodings are grouped in three root directories wrt. their [problem domains](https://github.com/potassco/asprilo/specification):

- `./abc` contains encoding for asprilo domains A, B and C

- `./m` contains encodings for asprilo domain M

- `./control` contains encodings for supplementary features such as task assignment, highway constraints, etc. for all (some) asprilo domains

## File Name Convention

We adopt the following name conventions for the encoding files:

-   For the base name of encoding files

    -   capital letters `M`, `P`, `P`, and `D` stand for actions **move**, **pickup**, **putdown**, and **deliver**
    -   lower case suffixes `-c`, `-b`, and `-a` indicate the addressed problem domain

    -   specifically, this applies to all files matching
        - `./abc/goal-D-{a,b,c}.*`
        - `./control/control-{a,b,c,m}.*`
        - `./control/assign-{a,bcm}.*`
        - etc.
-   File extensions `*.lp*`, `*.ilp`, `*.clp`, `*.iclp` and `*.dlp` stand for regular, incremental,
    constraint, incremental constraint logic and difference logic programs, resp.
    - sometimes we need to disambiguate further, e.g. we use capital `C` in `*.Clp` and `*``*.iClp` to
      indicate that we use constraints for both robot & shelf positions and product quantities
-   Omissions of such indicators are treated like wild-cards, i.e., general applicability
-   Compatibility of encoding files is achieved by combing those with same (or similar) attributes.

## Interface to *asprilo* I/O Format

-   Files with base name prefix `input*` and `output*` handle I/O between asprilo and the encodings, e.g.

    ``` shell
    ./input.lp
    ./m/output-M.lp
    ./m/output-M.ilp
    ./abc/output-MPPD.ilp
    ./abc/output-MPPD.lp
    ...
    ```

-   Specifically,

    - `input.lp` converts *asprilo* instances to the format used in action theories and
    - `output*` files convert the resulting plan into the format of *asprilo*


## Action Theory

-   Files with base name prefix `action*` hold action theories, e.g.

    ``` shell

    ./m/action-M.lp
    ./m/action-M.ilp
    ./abc/action-MPP.ilp
    ./abc/action-MPP.lp
    ...
    ```

-   Encoded actions are **move**, **pickup**, and **put-down**.


## Goal Conditions

-   Files with base name prefix `goal*` hold goal conditions, e.g.

    ``` shell
    ./m/goal-M.ilp
    ./m/goal-M.lp
    ./abc/goal-D-a.lp
    ./abc/goal-D-a.ilp
    ./abc/goal-D-b.lp
    ./abc/goal-D-b.ilp
    ...
    ```

-   Except for asprilo domain M, they define what constitutes a **delivery** action indicated by capital letter `D` in the file names.
-   Goal conditions depend on the asprilo domain and, hence, use in directory `.abc/` base name suffixes `*-a`, `*-b` `*-c` for distinction

## Product Quantities

-   Files with base name prefix `quantities*` deal with amounts of products, e.g

    ``` shell
    ./abc/quantities.clp
    ./abc/quantities.iclp
    ./abc/quantities.ilp
    ./abc/quantities.lp
    ```

-   Goal condition encodings for domain A include quantity encodings fitting to their logic program type (`*.lp`, `*.ilp`, `.clp`, etc.)

## Strategies

-   Files with base name prefix `strategy` specify strategies, e.g.

    ``` shell
    ./abc/strategy-MPP.ilp
    ./abc/strategy-MPP.lp
    ```

-   *Some strategies may not work with all layouts!*
-   **Experimental feature!**

## Highways

-   Files with base name prefix `highways` specify conditions for highway gird nodes, e.g.

    ``` shell
    ./control/highways.lp
    ./control/highways.ilp
    ./control/highways.clp
    ./control/highways.iclp
    ```

## Optimization

-   Files with base name prefix `optimization*` specify objective functions, e.g.

    ``` shell
    ./abc/optimization.lp
    ./abc/optimization.ilp
    ```

-   **Experimental feature!**

## Heuristics

-   Files with base name prefix `heuristic*`  specifying heuristics with *clingo*'s `#heuristic` directive, e.g.

    ``` shell
    ./control/heuristic.lp
    ./control/heuristic.ilp
    ```

-   **Experimental feature!**

## Encoding Shorthands

-   Files with base name prefix `encoding*` provide shorthands to call matching action theory and goal encodings, e.g.

    ``` shell
    ./abc/encoding-a.lp
    ./abc/encoding-a.ilp
    ./abc/encoding-b.lp
    ./abc/encoding-b.ilp
    ./abc/encoding-c.lp
    ./abc/encoding-c.ilp
    ./m/encoding.lp
    ./m/encoding.ilp
    ...
    ```

-   This helps to shorten some calls (e.g. for benchmarking) and illustrate which encoding files fit together

## Invocation Examples

-   Some warehouse layouts merged with orders can be found in the directory
    [`./examples`](./examples) Many of them contain (uncommented) calls in their header, e.g.


    ``` shell
    clingo action-MPP.lp strategy-MPP.lp goal-D-c.lp show.lp \
           examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=8
    ```

-   There are also auxiliary bash scripts that for a clean output of facts:
    - ./`clingo1facts` to print only facts in one line
    - ./ `clingo2facts` to additionally print each fact in a new line (`--out-ifs='\n'`)


## *asprilo* Visualization

You can display your instance and plan execution in the asprilo's visualizer on the command-line by running

```shell
clingo $OPTS $ENCODINGS --outf=0 -V0 --out-atomf=%s. | \
head -n 1 | \
$VIZUALIZER
```

where

- `$ENCODINGS` holds your list of encoding file paths
- `$OPTS` holds your clingo options
- clingo options`--outf=0 -V0 --out-atomf=%s.` formats the output answer set in adherence to *asprilo*'s input format
- UNIX command `head -n1` strips off the trailing `(UN)SATISFIABLE`
- `$VIZUALIZER` holds the path to the asprilo visualizer script

For example

```shell
clingo abc/{action-MPP.lp,goal-D-c.lp} examples/x4_y4_n16_r2_s3_ps1_pr2_u4_o2_N1.lp -c horizon=8
output-MPPD.lp --outf=0 -V0 --out-atomf=%s. | head -n1 | $VISUALIZER

```

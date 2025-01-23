
#import "@preview/ctheorems:1.1.3": *

#let conjecture = thmplain("conjecture", "Conjecture", titlefmt: strong)

#let theorem = thmplain("theorem", "Theorem", base: none, titlefmt: strong)
#let lemma = thmplain("theorem", "Lemma", base: none, titlefmt: strong)
#let proposition = thmplain("proposition", "Lemma", base: none, titlefmt: strong)

#let corollary = thmplain("corollary", "Corollary", base: "theorem", titlefmt: strong)

#let imp_theorem = thmplain("theorem", "Imported Theorem", titlefmt: strong)
#let inf_theorem = thmplain("theorem", "Informal Theorem", titlefmt: strong)

#let definition = thmplain("definition", "Definition", titlefmt: strong)
#let claim = thmplain("claim", "Claim", titlefmt: strong)
#let observation = thmplain("observation", "Observation", titlefmt: strong, base: none)
#let property = thmplain("property", "Property", titlefmt: strong, base: none)
#let notation = thmplain("notation", "Notation", titlefmt: strong, base: none)

#let proof = thmproof("proof", "Proof")

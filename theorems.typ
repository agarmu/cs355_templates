
#import "@preview/ctheorems:1.1.3": *

#let conjecture = thmplain("conjecture", "Conjecture", titlefmt: strong)

#let theorem = thmplain("theorem", "Theorem", base: "heading", titlefmt: strong)
#let lemma = thmplain("theorem", "Lemma", base: "heading", titlefmt: strong)
#let proposition = thmplain("proposition", "Lemma", base: "heading", titlefmt: strong)

#let corollary = thmplain("corollary", "Corollary", base: "theorem", titlefmt: strong)

#let imp_theorem = thmplain("theorem", "Imported Theorem", titlefmt: strong)
#let inf_theorem = thmplain("theorem", "Informal Theorem", titlefmt: strong)

#let definition = thmplain("definition", "Definition", titlefmt: strong)
#let claim = thmplain("claim", "Claim", titlefmt: strong)
#let observation = thmplain("observation", "Observation", titlefmt: strong, base: "heading")
#let property = thmplain("property", "Property", titlefmt: strong, base: "heading")
#let notation = thmplain("notation", "Notation", titlefmt: strong, base: "heading")

#let proof = thmproof("proof", "Proof")

open Ppxlib
   let rule =
      let ppx =
        let ast_context = Extension.Context.expression in
        let pl = Ast_pattern.(pstr nil) in
        let expand_fn ~ctxt =
          let loc = Expansion_context.Extension.extension_point_loc ctxt in
          Ast_builder.Default.eint ~loc 0 in
        Extension.V3.declare "just_zero" ast_context pl expand_fn
   in
   Ppxlib.Context_free.Rule.extension ppx
   let () = Driver.register_transformation ~rules:[ rule ] "just_zero"

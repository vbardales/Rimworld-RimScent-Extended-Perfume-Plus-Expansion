@requires:romyashi.perfumes
Feature: Perfumes scent extensions

  Scenario Outline: a Perfumes hediff carries its RimScent thought
    Then RimScent Perfume Plus: HediffDef "<hediff>" carries scent thought "<thought>"

    Examples:
      | hediff              | thought                                      |
      | Romy_FlowerPerfume  | RimScentExtended_Scent_PerfumeFlower        |
      | Romy_PlantPerfume   | RimScentExtended_Scent_PerfumePlant         |
      | Romy_HuntingPerfume | RimScentExtended_Scent_PerfumeHunting       |
      | Romy_AncientPerfume | RimScentExtended_Scent_PerfumeAncient       |

@requires:mlie.socialsupplements
Feature: Social Supplements scent extensions

  Scenario Outline: a Social Supplements hediff carries its RimScent thought
    Then RimScent Perfume Plus: HediffDef "<hediff>" carries scent thought "<thought>"

    Examples:
      | hediff                | thought                                  |
      | HedSSScentNeutral     | RimScentExtended_Scent_WornScent         |
      | HedSSScentMale        | RimScentExtended_Scent_WornScent         |
      | HedSSScentFemale      | RimScentExtended_Scent_WornScent         |
      | SSVape_Regular_High   | RimScentExtended_Scent_Vapour            |
      | SSVape_Fruity_High    | RimScentExtended_Scent_Vapour            |
      | SSMouthWash_High      | RimScentExtended_Scent_Mint              |
      | SSMintTea_High        | RimScentExtended_Scent_Mint              |

using System;
using System.Reflection;
using RimWorld;
using RimWorks.Pickle;
using Verse;

namespace RimScentExtendedPerfumePlus.PickleSteps
{
    [PickleSteps]
    public class ScentExtensionSteps
    {
        private const string ScentExtensionType = "RimScentReworked.ModExtension_Scent";

        [Then("RimScent Perfume Plus: HediffDef {string} carries scent thought {string}")]
        public void HediffCarriesScentThought(PickleContext context, string hediffDefName, string thoughtDefName)
        {
            HediffDef hediff = DefDatabase<HediffDef>.GetNamedSilentFail(hediffDefName);
            context.Require(hediff != null, $"HediffDef '{hediffDefName}' is not loaded in this pass.");

            ThoughtDef expectedThought = DefDatabase<ThoughtDef>.GetNamedSilentFail(thoughtDefName);
            context.Require(expectedThought != null, $"ThoughtDef '{thoughtDefName}' is not loaded in this pass.");

            DefModExtension scentExtension = null;
            foreach (DefModExtension extension in hediff.modExtensions ?? new System.Collections.Generic.List<DefModExtension>())
            {
                if (string.Equals(extension.GetType().FullName, ScentExtensionType, StringComparison.Ordinal))
                {
                    scentExtension = extension;
                    break;
                }
            }

            context.Require(scentExtension != null,
                $"HediffDef '{hediffDefName}' has no {ScentExtensionType}; loaded extensions: {DescribeExtensions(hediff)}");

            FieldInfo thoughtField = scentExtension.GetType().GetField("thought", BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic);
            context.Require(thoughtField != null,
                $"{ScentExtensionType} on '{hediffDefName}' exposes no thought field.");

            ThoughtDef actualThought = thoughtField.GetValue(scentExtension) as ThoughtDef;
            context.Assert(actualThought == expectedThought,
                $"HediffDef '{hediffDefName}' should carry scent thought '{thoughtDefName}', but carries '{actualThought?.defName ?? "(none)"}'.");
        }

        private static string DescribeExtensions(HediffDef hediff)
        {
            if (hediff.modExtensions == null || hediff.modExtensions.Count == 0)
            {
                return "(none)";
            }

            var names = new System.Collections.Generic.List<string>();
            foreach (DefModExtension extension in hediff.modExtensions)
            {
                names.Add(extension.GetType().FullName);
            }
            return string.Join(", ", names);
        }
    }
}

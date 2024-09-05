import { MatugenColors, MatugenVariation } from "lib/types/options";

/*
 * NOTE: This maps the values of the default colors to the values generated by Matugen.
 * Each of the variations are carefully tested and curated to make sure that colors don't
 * have weird luminocity overlaps (light on light, dark on dark).
 */
export const getMatugenVariations = (matugenColors: MatugenColors, variation: MatugenVariation) => {
    const matVtns = {
        "standard_1": {
            "rosewater": matugenColors.secondary,
            "flamingo": matugenColors.secondary,
            "pink": matugenColors.tertiary,
            "mauve": matugenColors.primary,
            "red": matugenColors.tertiary,
            "maroon": matugenColors.primary,
            "peach": matugenColors.tertiary,
            "yellow": matugenColors.secondary,
            "green": matugenColors.primary,
            "teal": matugenColors.secondary,
            "sky": matugenColors.secondary,
            "sapphire": matugenColors.primary,
            "blue": matugenColors.primary,
            "lavender": matugenColors.primary,
            "text": matugenColors.on_background,
            "subtext1": matugenColors.outline,
            "subtext2": matugenColors.outline,
            "overlay2": matugenColors.outline,
            "overlay1": matugenColors.outline,
            "overlay0": matugenColors.outline,
            "surface2": matugenColors.outline,
            "surface1": matugenColors.surface_bright,
            "surface0": matugenColors.surface_bright,
            "base2": matugenColors.inverse_on_surface,
            "base": matugenColors.inverse_on_surface,
            "mantle": matugenColors.surface_dim,
            "crust": matugenColors.surface_dim,
            "notifications_closer": matugenColors.primary,
            "notifications_background": matugenColors.surface_dim,
            "dashboard_btn_text": matugenColors.surface_dim,
            "red2": matugenColors.tertiary,
            "peach2": matugenColors.tertiary,
            "pink2": matugenColors.tertiary,
            "mantle2": matugenColors.surface_dim,
            "surface1_2": matugenColors.inverse_on_surface,
            "surface0_2": matugenColors.surface_bright,
            "overlay1_2": matugenColors.outline,
            "text2": matugenColors.on_background,
            "lavender2": matugenColors.primary,
            "crust2": matugenColors.surface_dim,
            "maroon2": matugenColors.primary,
            "mauve2": matugenColors.primary,
            "green2": matugenColors.primary,
            "surface2_2": matugenColors.surface,
            "sky2": matugenColors.secondary,
            "teal2": matugenColors.secondary,
            "yellow2": matugenColors.secondary,
            "pink3": matugenColors.tertiary,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.inverse_on_surface,
            "surface0_3": matugenColors.outline,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.outline,
            "lavender3": matugenColors.primary,
            "mauve3": matugenColors.primary,
            "green3": matugenColors.primary,
            "sky3": matugenColors.secondary,
            "teal3": matugenColors.secondary,
            "yellow3": matugenColors.secondary,
            "maroon3": matugenColors.primary,
            "crust3": matugenColors.surface_dim,
        },
        "standard_2": {
            "rosewater": matugenColors.primary,
            "flamingo": matugenColors.primary,
            "pink": matugenColors.tertiary,
            "mauve": matugenColors.secondary,
            "red": matugenColors.tertiary,
            "maroon": matugenColors.secondary,
            "peach": matugenColors.tertiary,
            "yellow": matugenColors.primary,
            "green": matugenColors.secondary,
            "teal": matugenColors.primary,
            "sky": matugenColors.primary,
            "sapphire": matugenColors.secondary,
            "blue": matugenColors.secondary,
            "lavender": matugenColors.secondary,
            "text": matugenColors.on_background,
            "subtext1": matugenColors.outline,
            "subtext2": matugenColors.outline,
            "overlay2": matugenColors.outline,
            "overlay1": matugenColors.outline,
            "overlay0": matugenColors.outline,
            "surface2": matugenColors.outline,
            "surface1": matugenColors.surface_bright,
            "surface0": matugenColors.surface_bright,
            "base2": matugenColors.inverse_on_surface,
            "base": matugenColors.inverse_on_surface,
            "mantle": matugenColors.surface_dim,
            "crust": matugenColors.surface_dim,
            "notifications_closer": matugenColors.tertiary,
            "notifications_background": matugenColors.surface_dim,
            "dashboard_btn_text": matugenColors.surface_dim,
            "red2": matugenColors.tertiary,
            "peach2": matugenColors.tertiary,
            "pink2": matugenColors.tertiary,
            "mantle2": matugenColors.surface_dim,
            "surface1_2": matugenColors.inverse_on_surface,
            "surface0_2": matugenColors.surface_bright,
            "overlay1_2": matugenColors.outline,
            "text2": matugenColors.on_background,
            "lavender2": matugenColors.secondary,
            "crust2": matugenColors.surface_dim,
            "maroon2": matugenColors.secondary,
            "surface2_2": matugenColors.surface,
            "mauve2": matugenColors.secondary,
            "green2": matugenColors.secondary,
            "sky2": matugenColors.primary,
            "teal2": matugenColors.primary,
            "yellow2": matugenColors.primary,
            "pink3": matugenColors.tertiary,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.inverse_on_surface,
            "surface0_3": matugenColors.outline,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.outline,
            "lavender3": matugenColors.secondary,
            "mauve3": matugenColors.secondary,
            "green3": matugenColors.secondary,
            "sky3": matugenColors.primary,
            "teal3": matugenColors.primary,
            "yellow3": matugenColors.primary,
            "maroon3": matugenColors.secondary,
            "crust3": matugenColors.surface_dim,
        },
        "standard_3": {
            "rosewater": matugenColors.secondary,
            "flamingo": matugenColors.secondary,
            "pink": matugenColors.secondary,
            "mauve": matugenColors.primary,
            "red": matugenColors.secondary,
            "maroon": matugenColors.primary,
            "peach": matugenColors.secondary,
            "yellow": matugenColors.secondary,
            "green": matugenColors.primary,
            "teal": matugenColors.secondary,
            "sky": matugenColors.secondary,
            "sapphire": matugenColors.primary,
            "blue": matugenColors.primary,
            "lavender": matugenColors.primary,
            "text": matugenColors.on_background,
            "subtext1": matugenColors.outline,
            "subtext2": matugenColors.outline,
            "overlay2": matugenColors.outline,
            "overlay1": matugenColors.outline,
            "overlay0": matugenColors.outline,
            "surface2": matugenColors.outline,
            "surface1": matugenColors.surface_bright,
            "surface0": matugenColors.surface_bright,
            "base2": matugenColors.inverse_on_surface,
            "base": matugenColors.inverse_on_surface,
            "mantle": matugenColors.surface_dim,
            "crust": matugenColors.surface_dim,
            "notifications_closer": matugenColors.secondary,
            "notifications_background": matugenColors.surface_dim,
            "dashboard_btn_text": matugenColors.surface_dim,
            "red2": matugenColors.secondary,
            "peach2": matugenColors.secondary,
            "pink2": matugenColors.secondary,
            "mantle2": matugenColors.surface_dim,
            "surface1_2": matugenColors.inverse_on_surface,
            "surface0_2": matugenColors.surface_bright,
            "surface2_2": matugenColors.surface,
            "overlay1_2": matugenColors.outline,
            "text2": matugenColors.on_background,
            "lavender2": matugenColors.primary,
            "crust2": matugenColors.surface_dim,
            "maroon2": matugenColors.primary,
            "mauve2": matugenColors.primary,
            "green2": matugenColors.primary,
            "sky2": matugenColors.secondary,
            "teal2": matugenColors.secondary,
            "yellow2": matugenColors.secondary,
            "pink3": matugenColors.secondary,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.inverse_on_surface,
            "surface0_3": matugenColors.outline,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.outline,
            "lavender3": matugenColors.primary,
            "mauve3": matugenColors.primary,
            "green3": matugenColors.primary,
            "sky3": matugenColors.secondary,
            "teal3": matugenColors.secondary,
            "yellow3": matugenColors.secondary,
            "maroon3": matugenColors.primary,
            "crust3": matugenColors.surface_dim,
        },
        "vivid_1": {
            "rosewater": matugenColors.surface,
            "flamingo": matugenColors.surface,
            "pink": matugenColors.surface,
            "mauve": matugenColors.surface,
            "red": matugenColors.surface,
            "maroon": matugenColors.surface,
            "peach": matugenColors.surface,
            "yellow": matugenColors.surface,
            "green": matugenColors.surface,
            "teal": matugenColors.surface,
            "sky": matugenColors.surface,
            "sapphire": matugenColors.surface,
            "blue": matugenColors.surface,
            "lavender": matugenColors.surface,
            "text": matugenColors.surface,
            "subtext1": matugenColors.primary_container,
            "subtext2": matugenColors.primary_container,
            "overlay2": matugenColors.primary_container,
            "overlay1": matugenColors.primary_container,
            "overlay0": matugenColors.primary_container,
            "surface2": matugenColors.surface_container_high,
            "surface1": matugenColors.surface_container_high,
            "surface0": matugenColors.surface_container_high,
            "base2": matugenColors.primary,
            "base": matugenColors.primary,
            "mantle": matugenColors.surface_container_low,
            "crust": matugenColors.surface_container_lowest,
            "red2": matugenColors.primary_container,
            "peach2": matugenColors.primary_container,
            "pink2": matugenColors.primary_container,
            "mantle2": matugenColors.primary,
            "surface1_2": matugenColors.primary,
            "surface0_2": matugenColors.primary,
            "overlay1_2": matugenColors.surface_container_high,
            "text2": matugenColors.outline,
            "lavender2": matugenColors.primary_container,
            "crust2": matugenColors.primary,
            "maroon2": matugenColors.primary_container,
            "mauve2": matugenColors.primary_container,
            "surface2_2": matugenColors.primary_container,
            "green2": matugenColors.primary_container,
            "sky2": matugenColors.primary_container,
            "teal2": matugenColors.primary_container,
            "yellow2": matugenColors.primary_container,
            "pink3": matugenColors.primary_fixed,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.primary,
            "surface0_3": matugenColors.primary,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.primary,
            "lavender3": matugenColors.primary,
            "mauve3": matugenColors.primary,
            "green3": matugenColors.primary_fixed,
            "sky3": matugenColors.primary,
            "teal3": matugenColors.primary,
            "yellow3": matugenColors.primary_fixed,
            "maroon3": matugenColors.primary_fixed,
            "crust3": matugenColors.primary,
        },
        "vivid_2": {
            "rosewater": matugenColors.surface,
            "flamingo": matugenColors.surface,
            "pink": matugenColors.surface,
            "mauve": matugenColors.surface,
            "red": matugenColors.surface,
            "maroon": matugenColors.surface,
            "peach": matugenColors.surface,
            "yellow": matugenColors.surface,
            "green": matugenColors.surface,
            "teal": matugenColors.surface,
            "sky": matugenColors.surface,
            "sapphire": matugenColors.surface,
            "blue": matugenColors.surface,
            "lavender": matugenColors.surface,
            "text": matugenColors.surface,
            "subtext1": matugenColors.secondary_container,
            "subtext2": matugenColors.secondary_container,
            "overlay2": matugenColors.secondary_container,
            "overlay1": matugenColors.secondary_container,
            "overlay0": matugenColors.secondary_container,
            "surface2": matugenColors.surface_container_high,
            "surface1": matugenColors.surface_container_high,
            "surface0": matugenColors.surface_container_high,
            "base2": matugenColors.secondary,
            "base": matugenColors.secondary,
            "mantle": matugenColors.surface_container_low,
            "crust": matugenColors.surface_container_lowest,
            "red2": matugenColors.secondary_container,
            "peach2": matugenColors.secondary_container,
            "pink2": matugenColors.secondary_container,
            "surface2_2": matugenColors.primary_container,
            "mantle2": matugenColors.secondary,
            "surface1_2": matugenColors.secondary,
            "surface0_2": matugenColors.secondary,
            "overlay1_2": matugenColors.surface_container_high,
            "text2": matugenColors.outline,
            "lavender2": matugenColors.secondary_container,
            "crust2": matugenColors.secondary,
            "maroon2": matugenColors.secondary_container,
            "mauve2": matugenColors.secondary_container,
            "green2": matugenColors.secondary_container,
            "sky2": matugenColors.secondary_container,
            "teal2": matugenColors.secondary_container,
            "yellow2": matugenColors.secondary_container,
            "pink3": matugenColors.secondary_fixed,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.secondary,
            "surface0_3": matugenColors.secondary,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.secondary,
            "lavender3": matugenColors.secondary,
            "mauve3": matugenColors.secondary,
            "green3": matugenColors.secondary_fixed,
            "sky3": matugenColors.secondary,
            "teal3": matugenColors.secondary,
            "yellow3": matugenColors.secondary_fixed,
            "maroon3": matugenColors.secondary_fixed,
            "crust3": matugenColors.secondary,
        },
        "vivid_3": {
            "rosewater": matugenColors.surface,
            "flamingo": matugenColors.surface,
            "pink": matugenColors.surface,
            "mauve": matugenColors.surface,
            "red": matugenColors.surface,
            "maroon": matugenColors.surface,
            "peach": matugenColors.surface,
            "yellow": matugenColors.surface,
            "green": matugenColors.surface,
            "teal": matugenColors.surface,
            "sky": matugenColors.surface,
            "sapphire": matugenColors.surface,
            "blue": matugenColors.surface,
            "lavender": matugenColors.surface,
            "text": matugenColors.surface,
            "subtext1": matugenColors.tertiary_container,
            "subtext2": matugenColors.tertiary_container,
            "overlay2": matugenColors.tertiary_container,
            "overlay1": matugenColors.tertiary_container,
            "overlay0": matugenColors.tertiary_container,
            "surface2": matugenColors.surface_container_high,
            "surface1": matugenColors.surface_container_high,
            "surface0": matugenColors.surface_container_high,
            "base2": matugenColors.tertiary,
            "base": matugenColors.tertiary,
            "mantle": matugenColors.surface_container_low,
            "crust": matugenColors.surface_container_lowest,
            "red2": matugenColors.tertiary_container,
            "peach2": matugenColors.tertiary_container,
            "pink2": matugenColors.tertiary_container,
            "mantle2": matugenColors.tertiary,
            "surface1_2": matugenColors.tertiary,
            "surface0_2": matugenColors.tertiary,
            "overlay1_2": matugenColors.surface_container_high,
            "text2": matugenColors.outline,
            "lavender2": matugenColors.tertiary_container,
            "surface2_2": matugenColors.primary_container,
            "crust2": matugenColors.tertiary,
            "maroon2": matugenColors.tertiary_container,
            "mauve2": matugenColors.tertiary_container,
            "green2": matugenColors.tertiary_container,
            "sky2": matugenColors.tertiary_container,
            "teal2": matugenColors.tertiary_container,
            "yellow2": matugenColors.tertiary_container,
            "pink3": matugenColors.tertiary_fixed,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.tertiary,
            "surface0_3": matugenColors.tertiary,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.tertiary,
            "lavender3": matugenColors.tertiary,
            "mauve3": matugenColors.tertiary,
            "green3": matugenColors.tertiary_fixed,
            "sky3": matugenColors.tertiary,
            "teal3": matugenColors.tertiary,
            "yellow3": matugenColors.tertiary_fixed,
            "maroon3": matugenColors.tertiary_fixed,
            "crust3": matugenColors.tertiary,
        },
        "monochrome_1": {
            "rosewater": matugenColors.primary,
            "flamingo": matugenColors.primary,
            "pink": matugenColors.primary,
            "mauve": matugenColors.primary,
            "red": matugenColors.primary,
            "maroon": matugenColors.primary,
            "peach": matugenColors.primary,
            "yellow": matugenColors.primary,
            "green": matugenColors.primary,
            "teal": matugenColors.primary,
            "sky": matugenColors.primary,
            "sapphire": matugenColors.primary,
            "blue": matugenColors.primary,
            "lavender": matugenColors.primary,
            "text": matugenColors.on_background,
            "subtext1": matugenColors.outline,
            "subtext2": matugenColors.outline,
            "overlay2": matugenColors.outline,
            "overlay1": matugenColors.outline,
            "overlay0": matugenColors.outline,
            "surface2": matugenColors.outline,
            "surface1": matugenColors.surface_bright,
            "surface0": matugenColors.surface_bright,
            "base2": matugenColors.inverse_on_surface,
            "base": matugenColors.inverse_on_surface,
            "mantle": matugenColors.surface_dim,
            "crust": matugenColors.surface_dim,
            "notifications_closer": matugenColors.primary,
            "notifications_background": matugenColors.surface_dim,
            "dashboard_btn_text": matugenColors.surface_dim,
            "red2": matugenColors.primary,
            "peach2": matugenColors.primary,
            "pink2": matugenColors.primary,
            "mantle2": matugenColors.surface_dim,
            "surface1_2": matugenColors.inverse_on_surface,
            "surface0_2": matugenColors.surface_bright,
            "surface2_2": matugenColors.surface,
            "overlay1_2": matugenColors.outline,
            "text2": matugenColors.on_background,
            "lavender2": matugenColors.primary,
            "crust2": matugenColors.surface_dim,
            "maroon2": matugenColors.primary,
            "mauve2": matugenColors.primary,
            "green2": matugenColors.primary,
            "sky2": matugenColors.primary,
            "teal2": matugenColors.primary,
            "yellow2": matugenColors.primary,
            "pink3": matugenColors.primary,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.inverse_on_surface,
            "surface0_3": matugenColors.outline,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.outline,
            "lavender3": matugenColors.primary,
            "mauve3": matugenColors.primary,
            "green3": matugenColors.primary,
            "sky3": matugenColors.primary,
            "teal3": matugenColors.primary,
            "yellow3": matugenColors.primary,
            "maroon3": matugenColors.primary,
            "crust3": matugenColors.surface_dim,
        },
        "monochrome_2": {
            "rosewater": matugenColors.secondary,
            "flamingo": matugenColors.secondary,
            "pink": matugenColors.secondary,
            "mauve": matugenColors.secondary,
            "red": matugenColors.secondary,
            "maroon": matugenColors.secondary,
            "peach": matugenColors.secondary,
            "yellow": matugenColors.secondary,
            "green": matugenColors.secondary,
            "teal": matugenColors.secondary,
            "sky": matugenColors.secondary,
            "sapphire": matugenColors.secondary,
            "blue": matugenColors.secondary,
            "lavender": matugenColors.secondary,
            "text": matugenColors.on_background,
            "subtext1": matugenColors.outline,
            "subtext2": matugenColors.outline,
            "overlay2": matugenColors.outline,
            "overlay1": matugenColors.outline,
            "overlay0": matugenColors.outline,
            "surface2": matugenColors.outline,
            "surface1": matugenColors.surface_bright,
            "surface0": matugenColors.surface_bright,
            "base2": matugenColors.inverse_on_surface,
            "base": matugenColors.inverse_on_surface,
            "mantle": matugenColors.surface_dim,
            "crust": matugenColors.surface_dim,
            "notifications_closer": matugenColors.secondary,
            "notifications_background": matugenColors.surface_dim,
            "dashboard_btn_text": matugenColors.surface_dim,
            "red2": matugenColors.secondary,
            "peach2": matugenColors.secondary,
            "pink2": matugenColors.secondary,
            "mantle2": matugenColors.surface_dim,
            "surface1_2": matugenColors.inverse_on_surface,
            "surface0_2": matugenColors.surface_bright,
            "overlay1_2": matugenColors.outline,
            "surface2_2": matugenColors.surface,
            "text2": matugenColors.on_background,
            "lavender2": matugenColors.secondary,
            "crust2": matugenColors.surface_dim,
            "maroon2": matugenColors.secondary,
            "mauve2": matugenColors.secondary,
            "green2": matugenColors.secondary,
            "sky2": matugenColors.secondary,
            "teal2": matugenColors.secondary,
            "yellow2": matugenColors.secondary,
            "pink3": matugenColors.secondary,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.inverse_on_surface,
            "surface0_3": matugenColors.outline,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.outline,
            "lavender3": matugenColors.secondary,
            "mauve3": matugenColors.secondary,
            "green3": matugenColors.secondary,
            "sky3": matugenColors.secondary,
            "teal3": matugenColors.secondary,
            "yellow3": matugenColors.secondary,
            "maroon3": matugenColors.secondary,
            "crust3": matugenColors.surface_dim,
        },
        "monochrome_3": {
            "rosewater": matugenColors.tertiary,
            "flamingo": matugenColors.tertiary,
            "pink": matugenColors.tertiary,
            "mauve": matugenColors.tertiary,
            "red": matugenColors.tertiary,
            "maroon": matugenColors.tertiary,
            "peach": matugenColors.tertiary,
            "yellow": matugenColors.tertiary,
            "green": matugenColors.tertiary,
            "teal": matugenColors.tertiary,
            "sky": matugenColors.tertiary,
            "sapphire": matugenColors.tertiary,
            "blue": matugenColors.tertiary,
            "lavender": matugenColors.tertiary,
            "text": matugenColors.on_background,
            "subtext1": matugenColors.outline,
            "subtext2": matugenColors.outline,
            "overlay2": matugenColors.outline,
            "overlay1": matugenColors.outline,
            "overlay0": matugenColors.outline,
            "surface2": matugenColors.outline,
            "surface1": matugenColors.surface_bright,
            "surface0": matugenColors.surface_bright,
            "base2": matugenColors.inverse_on_surface,
            "base": matugenColors.inverse_on_surface,
            "mantle": matugenColors.surface_dim,
            "crust": matugenColors.surface_dim,
            "notifications_closer": matugenColors.tertiary,
            "notifications_background": matugenColors.surface_dim,
            "dashboard_btn_text": matugenColors.surface_dim,
            "red2": matugenColors.tertiary,
            "peach2": matugenColors.tertiary,
            "pink2": matugenColors.tertiary,
            "mantle2": matugenColors.surface_dim,
            "surface1_2": matugenColors.inverse_on_surface,
            "surface0_2": matugenColors.surface_bright,
            "overlay1_2": matugenColors.outline,
            "text2": matugenColors.on_background,
            "lavender2": matugenColors.tertiary,
            "crust2": matugenColors.surface_dim,
            "maroon2": matugenColors.tertiary,
            "surface2_2": matugenColors.surface,
            "mauve2": matugenColors.tertiary,
            "green2": matugenColors.tertiary,
            "sky2": matugenColors.tertiary,
            "teal2": matugenColors.tertiary,
            "yellow2": matugenColors.tertiary,
            "pink3": matugenColors.tertiary,
            "red3": matugenColors.secondary,
            "mantle3": matugenColors.inverse_on_surface,
            "surface0_3": matugenColors.outline,
            "surface2_3": matugenColors.outline,
            "overlay1_3": matugenColors.outline,
            "lavender3": matugenColors.tertiary,
            "mauve3": matugenColors.tertiary,
            "green3": matugenColors.tertiary,
            "sky3": matugenColors.tertiary,
            "teal3": matugenColors.tertiary,
            "yellow3": matugenColors.tertiary,
            "maroon3": matugenColors.tertiary,
            "crust3": matugenColors.surface_dim,
        },

    };
    return matVtns[variation];
}

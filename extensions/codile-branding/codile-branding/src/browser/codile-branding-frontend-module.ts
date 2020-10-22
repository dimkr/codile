/**
 * Generated using theia-extension-generator
 */
import { CodileBrandingCommandContribution, CodileBrandingMenuContribution } from './codile-branding-contribution';
import {
    CommandContribution,
    MenuContribution
} from "@theia/core/lib/common";
import { ContainerModule } from "inversify";
import "./branding";
import "../../src/browser/style/index.css";

export default new ContainerModule(bind => {
    // add your contribution bindings here
    bind(CommandContribution).to(CodileBrandingCommandContribution);
    bind(MenuContribution).to(CodileBrandingMenuContribution);
});

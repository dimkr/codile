import { injectable } from "inversify";
import { CommandContribution, CommandRegistry, MenuContribution, MenuModelRegistry } from "@theia/core/lib/common";
import { CommonCommands, CommonMenus } from "@theia/core/lib/browser";
import { FileDownloadCommands } from "@theia/filesystem/lib/browser/download/file-download-command-contribution";

@injectable()
export class CodileBrandingCommandContribution implements CommandContribution {

    registerCommands(registry: CommandRegistry): void {
        registry.unregisterCommand(CommonCommands.ABOUT_COMMAND);
        registry.unregisterCommand(FileDownloadCommands.DOWNLOAD);
    }
}

@injectable()
export class CodileBrandingMenuContribution implements MenuContribution {

    registerMenus(menus: MenuModelRegistry): void {
        menus.unregisterMenuAction(CommonCommands.ABOUT_COMMAND);
        menus.unregisterMenuAction(FileDownloadCommands.DOWNLOAD);
        menus.unregisterMenuNode(CommonMenus.HELP[CommonMenus.HELP.length - 1]);
    }
}

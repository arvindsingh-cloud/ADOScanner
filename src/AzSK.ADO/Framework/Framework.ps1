Set-StrictMode -Version Latest

$libraryPath = (Get-Item $PSScriptRoot).Parent.FullName+ "\Lib";

## Load correct assemblies for the PowerShell platform
try {
    Add-Type -Path "$libraryPath\Microsoft.Identity.Client.dll";
}
catch {
}

$FrameworkPath = $PSScriptRoot

. $FrameworkPath\Models\Enums.ps1
. $FrameworkPath\Models\Common\Context.ps1
#Constants
. $PSScriptRoot\Helpers\Constants.ps1


#Models
. $FrameworkPath\Models\AzSKGenericEvent.ps1
. $FrameworkPath\Models\CommandDetails.ps1
. $FrameworkPath\Models\Exception\SuppressedException.ps1
. $FrameworkPath\Models\RemoteReports\CsvOutputModel.ps1
. $FrameworkPath\Models\FeatureFlight.ps1
. $FrameworkPath\Models\AzSKEvent.ps1
. $PSScriptRoot\Helpers\CommandHelper.ps1
. $FrameworkPath\Abstracts\EventBase.ps1
. $FrameworkPath\Helpers\JsonHelper.ps1
. $FrameworkPath\Helpers\Helpers.ps1
. $PSScriptRoot\Helpers\ContextHelper.ps1
#Helpers (independent of models)

. $FrameworkPath\Helpers\ConfigurationHelper.ps1

. $FrameworkPath\Models\AzSKConfig.ps1

. $PSScriptRoot\Models\AzSKSettings.ps1

. $FrameworkPath\Models\SVT\SVTConfig.ps1
. $FrameworkPath\Models\SVT\SVTEvent.ps1
. $FrameworkPath\Models\SVT\SVTResource.ps1
. $FrameworkPath\Models\SVT\AttestationOptions.ps1
. $FrameworkPath\Models\SVT\PSCloudService.ps1
. $FrameworkPath\Models\SVT\PartialScanResourceMap.ps1
. $FrameworkPath\Models\SVT\IncrementalScanTimestamps.ps1
. $FrameworkPath\Models\SVT\BatchScanResourceMap.ps1
. $FrameworkPath\Models\RemoteReports\ComplianceStateModel.ps1
. $FrameworkPath\Models\ControlState.ps1
. $FrameworkPath\Models\FixControl\FixControlModel.ps1
. $FrameworkPath\Models\RemoteReports\RecommendationReportModel.ps1
. $FrameworkPath\Models\RemoteReports\ScanResultModels.ps1

#Helpers
. $FrameworkPath\Helpers\Helpers.ps1
. $FrameworkPath\Managers\ConfigurationManager.ps1
. $PSScriptRoot\Helpers\ResourceHelper.ps1
. $FrameworkPath\Helpers\RateLimitHelper.ps1
. $FrameworkPath\Helpers\WebRequestHelper.ps1
. $PSScriptRoot\Helpers\SVTMapping.ps1
. $FrameworkPath\Helpers\IdentityHelpers.ps1
. $FrameworkPath\Helpers\ControlHelper.ps1
. $FrameworkPath\Helpers\ConfigOverride.ps1
. $PSScriptRoot\Helpers\AdministratorHelper.ps1
. $FrameworkPath\Models\Common\ResourceInventory.ps1


#Managers
. $FrameworkPath\Managers\BatchScanManager.ps1
. $FrameworkPath\Managers\BatchScanManagerForMultipleProjects.ps1
. $FrameworkPath\Managers\FeatureFlightingManager.ps1
. $PSScriptRoot\Managers\ControlStateExtension.ps1
. $FrameworkPath\Managers\AzSKPDFExtension.ps1
. $PSScriptRoot\Managers\PartialScanManager.ps1

. $FrameworkPath\Helpers\IncrementalScanHelper.ps1
. $FrameworkPath\Helpers\LogAnalyticsHelper.ps1
. $FrameworkPath\Helpers\RemoteReportHelper.ps1
. $FrameworkPath\Helpers\RemoteApiHelper.ps1
. $FrameworkPath\Abstracts\PrivacyNotice.ps1

. $FrameworkPath\Abstracts\MetaInfoProvider.ps1
#BugLog
. $PSScriptRoot\BugLog\BugLogPathManager.ps1
. $PSScriptRoot\BugLog\BugMetaInfoProvider.ps1
. $PSScriptRoot\BugLog\BugLogHelper.ps1
. $PSScriptRoot\BugLog\AutoBugLog.ps1
. $PSScriptRoot\BugLog\PublishToJSONAndCSV.ps1
. $PSScriptRoot\BugLog\AutoCloseBugManager.ps1


#Abstracts
. $FrameworkPath\Abstracts\AzSKRoot.ps1
. $FrameworkPath\Abstracts\SVTBase.ps1
. $PSScriptRoot\Abstracts\ADOSVTBase.ps1

. $FrameworkPath\Abstracts\FixControl\FixControlBase.ps1
. $FrameworkPath\Abstracts\FixControl\FixServicesBase.ps1

. $FrameworkPath\Abstracts\ListenerBase.ps1
. $FrameworkPath\Abstracts\FileOutputBase.ps1


#Listeners
. $FrameworkPath\Listeners\UserReports\WriteFolderPath.ps1
(Get-ChildItem -Path "$FrameworkPath\Listeners\UserReports" -Recurse -File -Include "*.ps1" -Exclude "WriteFolderPath.ps1") |
    ForEach-Object {
    . $_.FullName
}
. $FrameworkPath\Listeners\GenericListener\GenericListenerBase.ps1
. $FrameworkPath\Listeners\RemoteReports\TelemetryStrings.ps1
. $FrameworkPath\Helpers\RemoteReportHelper.ps1
. $FrameworkPath\Helpers\AIOrgTelemetryHelper.ps1
. $FrameworkPath\Helpers\InventoryHelper.ps1
. $FrameworkPath\Listeners\RemoteReports\RemoteReportsListener.ps1
. $FrameworkPath\Listeners\RemoteReports\AIOrgTelemetry.ps1
. $FrameworkPath\Listeners\RemoteReports\UsageTelemetry.ps1
. $FrameworkPath\Listeners\LogAnalytics\LogAnalyticsOutput.ps1
. $FrameworkPath\Listeners\FixControl\WriteFixControlFiles.ps1
. $FrameworkPath\Listeners\EventHub\EventHubOutput.ps1
. $FrameworkPath\Listeners\Webhook\WebhookOutput.ps1
. $PSScriptRoot\Listeners\PartialScanHandler\PartialScanHandler.ps1
. $FrameworkPath\Listeners\GenericListener\GenericListener.ps1
. $PSScriptRoot\Listeners\ListenerHelper.ps1

#SARIF Feature
. $PSScriptRoot\SARIF\SARIFLocation.ps1
. $PSScriptRoot\SARIF\SARIFRuleDescriptor.ps1
. $PSScriptRoot\SARIF\SARIFResult.ps1
. $PSScriptRoot\SARIF\SARIFDriver.ps1
. $PSScriptRoot\SARIF\SARIFTool.ps1
. $PSScriptRoot\SARIF\SARIFRun.ps1
. $PSScriptRoot\SARIF\SARIFLogs.ps1
. $PSScriptRoot\SARIF\SARIFLogsGenerator.ps1

#Remaining Abstracts
. $PSScriptRoot\Core\SVT\SVTControlAttestation.ps1
. $FrameworkPath\Abstracts\CommandBase.ps1

#Remaining Abstracts
. $FrameworkPath\Abstracts\SVTCommandBase.ps1
. $PSScriptRoot\Abstracts\ADOSVTCommandBase.ps1

#Core

(Get-ChildItem -Path "$PSScriptRoot\Core\SVT\ADO\" -Recurse -File) |
    ForEach-Object {
    . $_.FullName
}

. $PSScriptRoot\Core\AzSKADOInfo\HostInfo.ps1
. $PSScriptRoot\Core\AzSKADOInfo\ControlsInfo.ps1
. $PSScriptRoot\Core\AzSKADOInfo\UserInfo.ps1
. $PSScriptRoot\Core\AzSKADOInfo\OrganizationInfo.ps1
. $PSScriptRoot\Core\AzSKADOInfo\AADGroupsInfo.ps1
. $PSScriptRoot\Core\STMapping\ServiceMappingCacheHelper.ps1
. $PSScriptRoot\Core\STMapping\AzSKADOServiceMapping.ps1
. $PSScriptRoot\Core\SVT\CommonSVTResourceResolver.ps1
. $PSScriptRoot\Core\SVT\SVTResourceResolver.ps1
. $PSScriptRoot\Abstracts\ServicesSecurityStatus.ps1
. $PSScriptRoot\Core\SVT\Resolver.ps1
. $FrameworkPath\BugLog\AzSKADOAutoBugLogging.ps1
. $PSScriptRoot\Core\ContinuousAssurance\CAAutomation.ps1
. $PSScriptRoot\Core\ADOMonitoring\LogAnalyticsMonitoring.ps1

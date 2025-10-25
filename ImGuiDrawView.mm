//Require standard library
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
#include <iostream>
#include <UIKit/UIKit.h>
#include <vector>
#import "pthread.h"
#include <array>
#import <os/log.h>
#include <cmath>
#include <deque>
#include <fstream>
#include <algorithm>
#include "antiban/hook.h"
#include <string>
#include <sstream>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <cstdint>
#include <cinttypes>
#include <cerrno>
#include <cctype>
//Imgui library
#import "Esp/CaptainHook.h"
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_internal.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/zzz.h"
#include "oxorany/oxorany_include.h"
#import "Helper/Mem.h"
#include "font.h"
#import "Helper/Vector3.h"
#import "Helper/Vector2.h"
#import "Helper/Quaternion.h"
#import "Helper/Monostring.h"
#include "Helper/font.h"
#include "Helper/data.h"
ImFont* verdana_smol;
ImFont* pixel_big = {};
ImFont* pixel_smol = {};
#include "Helper/Obfuscate.h"
#import "Helper/Hooks.h"
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <unistd.h>
#include <string.h>

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale



// Guest hook logic

    
@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@end

@implementation ImGuiDrawView

bool rsttk = false;
bool Guest(void* _this){
    if (rsttk){
        return true;
    } else { 
        return true; 
    }
}

bool antiban(void *instance) {
    if(instance != nullptr) {
        return false;
    } else {
        return false;
    }
}

ImFont *_espFont;
ImFont* verdanab;
ImFont* icons;
ImFont* interb;
ImFont* Urbanist;
static bool MenDeal = true;
static float networkColor[3] = {1.0f, 1.0f, 1.0f};

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;

    ImGui::StyleColorsClassic();
    ImGuiStyle& style = ImGui::GetStyle();
    style.GrabRounding = 12.0f;  // Bo tròn nút kéo
    style.GrabMinSize = 15.0f;   // Làm nút kéo to hơn
    style.FramePadding = ImVec2(6.0f, 6.0f); // Làm thanh slider dày hơn
    auto& Style = ImGui::GetStyle();
    Style.WindowPadding = ImVec2(8.0f, 8.0f);
    Style.FramePadding = ImVec2(9.0f, 7.0f);
    Style.ScrollbarRounding = 9.0f;

        ImVec4* colors = ImGui::GetStyle().Colors;
        colors[ImGuiCol_Text] = ImVec4(0.0f, 0.8f, 1.0f, 1.0f);

        colors[ImGuiCol_WindowBg] = ImVec4(0.06f, 0.06f, 0.06f, 1.00f);
        colors[ImGuiCol_PopupBg] = ImVec4(0.09f, 0.09f, 0.09f, 1.00f);

        colors[ImGuiCol_FrameBg] = ImVec4(0.05f, 0.05f, 0.05f, 1.0f);
        colors[ImGuiCol_FrameBgHovered] = ImVec4(0.7f, 0.7f, 0.7f, 0.9f);
        colors[ImGuiCol_FrameBgActive] = ImVec4(0.02f, 0.02f, 0.02f, 1.0f);

        colors[ImGuiCol_TitleBg] = ImVec4(0.06f, 0.06f, 0.06f, 1.00f);
        colors[ImGuiCol_TitleBgActive] = ImVec4(0.14f, 0.14f, 0.14f, 1.00f);
        colors[ImGuiCol_CheckMark] = ImColor(255, 223, 0).Value;
        colors[ImGuiCol_ScrollbarBg] = ImVec4(0, 0, 0, 0);
        colors[ImGuiCol_ScrollbarGrab] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_ScrollbarGrabHovered] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_ScrollbarGrabActive] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_SliderGrab] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_SliderGrabActive] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_Button] = ImVec4(0.24f, 0.24f, 0.24f, 0.40f);
        colors[ImGuiCol_ButtonHovered] = ImVec4(0.25f, 0.25f, 0.25f, 1.00f);
        colors[ImGuiCol_ButtonActive] = ImVec4(0.32f, 0.32f, 0.32f, 1.00f);
        colors[ImGuiCol_Header] = ImVec4(0.73f, 0.73f, 0.73f, 0.31f);
        colors[ImGuiCol_HeaderHovered] = ImVec4(0.65f, 0.65f, 0.65f, 0.80f);
        colors[ImGuiCol_HeaderActive] = ImVec4(0.72f, 0.72f, 0.72f, 1.00f);
        colors[ImGuiCol_Separator] = ImVec4(0.50f, 0.50f, 0.50f, 0.50f);
        colors[ImGuiCol_SeparatorHovered] = ImVec4(0.52f, 0.52f, 0.52f, 0.78f);
        colors[ImGuiCol_SeparatorActive] = ImVec4(0.49f, 0.49f, 0.49f, 1.00f);
        colors[ImGuiCol_ResizeGrip] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_ResizeGripHovered] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_ResizeGripActive] = ImColor(163, 122, 195).Value;
        colors[ImGuiCol_Tab] = ImVec4(0.17f, 0.17f, 0.17f, 0.86f);
        colors[ImGuiCol_TabHovered] = ImVec4(0.29f, 0.29f, 0.29f, 0.80f);
        colors[ImGuiCol_TabActive] = ImVec4(0.40f, 0.40f, 0.40f, 1.00f);
        colors[ImGuiCol_TabUnfocused] = ImVec4(0.11f, 0.11f, 0.11f, 0.97f);
        colors[ImGuiCol_TabUnfocusedActive] = ImVec4(0.17f, 0.17f, 0.17f, 1.00f);
        colors[ImGuiCol_TextSelectedBg] = ImVec4(0.59f, 0.11f, 0.11f, 0.35f);
        colors[ImGuiCol_NavHighlight] = ImVec4(0.28f, 0.28f, 0.28f, 1.00f);
        style.Colors[ImGuiCol_WindowBg] = ImVec4(0.1f, 0.1f, 0.1f, 0.6f);
        style.Colors[ImGuiCol_Border] = ImVec4(0.2f, 0.2f, 0.2f, 0.3f);
        ImGui::GetStyle().Colors[ImGuiCol_ChildBg] = ImColor(36, 36, 38);

        ImGui::GetStyle().WindowRounding = 8 / 1.5f;
        ImGui::GetStyle().FrameRounding = 4 / 1.5f;
        ImGui::GetStyle().ChildRounding = 6 / 1.5f;
        ImGui::PushStyleVar(ImGuiStyleVar_FrameRounding, 10.0f);
        ImGui::PushStyleVar(ImGuiStyleVar_GrabRounding, 10.0f);  
        ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(4, 6)); 


        float sliderValue = Vars.AimFov; 
        float percentage = (sliderValue - 0.0f) / (500.0f - 0.0f);
        ImVec4 dynamicColor = ImVec4(0.0f, 0.5f + percentage * 0.5f, 1.0f, 1.0f);
        ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(2, 5));  
        ImGui::PushStyleVar(ImGuiStyleVar_GrabMinSize, 12.0f);  
        ImGui::PushStyleColor(ImGuiCol_FrameBg, ImVec4(0, 0, 0, 1)); 
        ImGui::PushStyleColor(ImGuiCol_FrameBgHovered, ImVec4(0, 0, 0, 1)); 
        ImGui::PushStyleColor(ImGuiCol_SliderGrab, dynamicColor);
        ImGui::PushStyleColor(ImGuiCol_SliderGrabActive, dynamicColor);

        ImGui::PopStyleColor(2);
        ImGui::PopStyleVar(2);

    ImFont* font = io.Fonts->AddFontFromMemoryTTF(sansbold, sizeof(sansbold), 15.0f, NULL, io.Fonts->GetGlyphRangesCyrillic());
    verdana_smol = io.Fonts->AddFontFromMemoryTTF(verdana, sizeof verdana, 40, NULL, io.Fonts->GetGlyphRangesCyrillic());
    pixel_big = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 128, NULL, io.Fonts->GetGlyphRangesCyrillic());
    pixel_smol = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 10*2, NULL, io.Fonts->GetGlyphRangesCyrillic());
    ImGui_ImplMetal_Init(_device);

    return self;
}
+ (void)showChange:(BOOL)open
{
    MenDeal = open;
}
- (MTKView *)mtkView
{
    return (MTKView *)self.view;
}
- (void)loadView
{
    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];

void* address[] = {
(void*)getRealOffset(0x1027D07B4),
(void*)getRealOffset(ENCRYPTOFFSET("0x1044290AC")),
                    (void*)getRealOffset(ENCRYPTOFFSET("0x10594F6F0")),
                    (void*)getRealOffset(ENCRYPTOFFSET("0x10594F8E0")),
                    (void*)getRealOffset(ENCRYPTOFFSET("0x10594EF2C"))

    };
    void* function[] = {
        (void*)Guest,
    (void*)antiban,
    (void*)antiban,
    (void*)antiban,
    (void*)antiban
    };
    hook(address, function, 5);

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mtkView.device = self.device;
    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;

}



#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

#pragma mark - MTKViewDelegate

void DrawMovingWeb(ImDrawList* drawList, ImVec2 menuPos, ImVec2 menuSize) {
    static std::vector<ImVec2> nodes;
    static std::vector<ImVec2> velocities;
    static float timeElapsed = 0.0f;
    static float hue = 0.0f; 
    static ImColor currentColor = ImColor::HSV(hue, 1.0f, 1.0f); 
    float maxDistance = 120.0f; 
    float speed = 0.6f; 
    ImVec2 menuEnd = ImVec2(menuPos.x + menuSize.x, menuPos.y + menuSize.y);

    if (nodes.empty()) {
        for (int i = 0; i < 10; i++) {
            float x = menuPos.x + (rand() % (int)menuSize.x);
            float y = menuPos.y + (rand() % (int)menuSize.y);
            nodes.push_back(ImVec2(x, y));

            float vx = (rand() % 100 - 50) / 100.0f * speed;
            float vy = (rand() % 100 - 50) / 100.0f * speed;
            velocities.push_back(ImVec2(vx, vy));
        }
    }

    timeElapsed += ImGui::GetIO().DeltaTime;
    if (timeElapsed >= 0.02f) { 
        timeElapsed = 0.0f;
        hue += 0.01f; 
        if (hue > 1.0f) hue -= 1.0f; 
        currentColor = ImColor::HSV(hue, 1.0f, 1.0f); 
    }

    for (size_t i = 0; i < nodes.size(); i++) {
        nodes[i].x += velocities[i].x;
        nodes[i].y += velocities[i].y;

        if (nodes[i].x <= menuPos.x || nodes[i].x >= menuEnd.x) {
            velocities[i].x *= -1; 
        }
        if (nodes[i].y <= menuPos.y || nodes[i].y >= menuEnd.y) {
            velocities[i].y *= -1; 
        }
 
        nodes[i].x = std::clamp(nodes[i].x, menuPos.x, menuEnd.x);
        nodes[i].y = std::clamp(nodes[i].y, menuPos.y, menuEnd.y);
    }

    for (auto& node : nodes) {
        ImVec2 textSize = ImGui::CalcTextSize("NhanDev");
        ImVec2 textPos = ImVec2(node.x - textSize.x / 2, node.y - textSize.y / 2);

        ImColor textColor = ImColor(255, 255, 255, 255); 


        drawList->AddText(textPos, textColor, "NhanDev");

        for (auto& other : nodes) {
            float dx = node.x - other.x;
            float dy = node.y - other.y;
            float distance = sqrt(dx * dx + dy * dy);

            if (distance < maxDistance) {
                float alpha = 1.0f - (distance / maxDistance);
                ImColor lineColor = ImColor(
                    networkColor[0] * 255,
                    networkColor[1] * 255,
                    networkColor[2] * 255,
                    alpha * 255
                );

                drawList->AddLine(node, other, lineColor);
            }
        }
    }
}

void DrawRGBBorder(ImDrawList* draw_list, ImVec2 pos, ImVec2 size, float thickness = 6.0f) {
    float time = ImGui::GetTime();
    int segments = 50;            
    float step = 1.0f / segments;  

    ImVec2 topLeft = pos;
    ImVec2 topRight = ImVec2(pos.x + size.x, pos.y);
    ImVec2 bottomRight = ImVec2(pos.x + size.x, pos.y + size.y);
    ImVec2 bottomLeft = ImVec2(pos.x, pos.y + size.y);

    for (int i = 0; i < segments; i++) {
        float hue = fmod((time * 0.3f) + step * i, 1.0f);  
        ImColor color = ImColor::HSV(hue, 1.0f, 1.0f);

        ImVec2 p1 = ImVec2(topLeft.x + (size.x * step * i), topLeft.y);
        ImVec2 p2 = ImVec2(topLeft.x + (size.x * step * (i + 1)), topLeft.y);
        draw_list->AddLine(p1, p2, color, thickness);

        p1 = ImVec2(topRight.x, topRight.y + (size.y * step * i));
        p2 = ImVec2(topRight.x, topRight.y + (size.y * step * (i + 1)));
        draw_list->AddLine(p1, p2, color, thickness);

        p1 = ImVec2(bottomRight.x - (size.x * step * i), bottomRight.y);
        p2 = ImVec2(bottomRight.x - (size.x * step * (i + 1)), bottomRight.y);
        draw_list->AddLine(p1, p2, color, thickness);

        p1 = ImVec2(bottomLeft.x, bottomLeft.y - (size.y * step * i));
        p2 = ImVec2(bottomLeft.x, bottomLeft.y - (size.y * step * (i + 1)));
        draw_list->AddLine(p1, p2, color, thickness);
    }
}



- (void)drawInMTKView:(MTKView*)view
{
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

    CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);
    
    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];
        
    if (MenDeal == true) {
        [self.view setUserInteractionEnabled:YES];
    } else {
        [self.view setUserInteractionEnabled:NO];
    }

    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil)
    {
        id <MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:@"ImGui Jane"];

        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
        ImGui::NewFrame();

        UIWindow *mainWindow = [UIApplication.sharedApplication.windows firstObject];
        CGFloat x = (mainWindow.bounds.size.width - 380) / 2;
        CGFloat y = (mainWindow.bounds.size.height - 260) / 2;

        ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(365, 270), ImGuiCond_FirstUseEver);

        if (MenDeal == true)
        {                
            ImGui::Begin(oxorany("The Nhan Dev"), &MenDeal);
            ImDrawList* draw_list = ImGui::GetWindowDrawList();
            ImVec2 menuPos = ImGui::GetWindowPos();
            ImVec2 menuSize = ImGui::GetWindowSize();

            DrawRGBBorder(draw_list, menuPos, menuSize, 4.0f);

            DrawMovingWeb(draw_list, menuPos, menuSize);
            if (ImGui::BeginTabBar(oxorany("Tab"),ImGuiTabBarFlags_FittingPolicyScroll)) {
                if (ImGui::BeginTabItem(("ESP"))) {
                    ImGui::Checkbox(oxorany("Enable Cheats"), &Vars.Enable);
                    if (ImGui::BeginTable("split", 4))
                    {
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Line"), &Vars.lines);
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Box"), &Vars.Box);
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Health"), &Vars.Health);
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Name"), &Vars.Name);
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Skeleton"), &Vars.skeleton);
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Distance"), &Vars.Distance);
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("3D Circle"), &Vars.circlepos);
                        ImGui::TableNextColumn();
                        ImGui::Checkbox(oxorany("Outline"), &Vars.Outline);
                    }
                    ImGui::EndTable();
                    ImGui::ColorEdit3(oxorany("NhanDev Color"), networkColor);
                    ImGui::Checkbox(oxorany("Out of Screen"), &Vars.OOF);
                    ImGui::SameLine();
                    ImGui::EndTabItem();
                }
                if (ImGui::BeginTabItem(("AIMBOT"))) {
                    ImGui::Spacing();
                    ImGui::Checkbox(oxorany("Enable Aimbot"), &Vars.Aimbot);
                    ImGui::Combo(oxorany("Aim When"), &Vars.AimWhen, Vars.dir, 4);
                    ImGui::SliderFloat(oxorany("Aim FOV"), &Vars.AimFov, 0.0f, 500.0f);
                    ImGui::Checkbox(oxorany("FOV Glow"), &Vars.fovaimglow);
                    if (Vars.fovaimglow) {
                        ImGui::ColorEdit4(oxorany("FOV Color"), Vars.fovLineColor);
                    }
                    ImGui::EndTabItem();
                }
                if (ImGui::BeginTabItem(("Info Developer"))) {
                    ImGui::TextDisabled("Project By Dinh The Nhan.");
                    if (ImGui::Button("Zalo")) {
                        NSURL *zaloURL = [NSURL URLWithString:@"https://zalo.me/0342031354"];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [[UIApplication sharedApplication] openURL:zaloURL options:@{} completionHandler:nil];
                        });
                    }
                    ImGui::SameLine();
                    if (ImGui::Button("TikTok")) {
                        NSURL *tiktokURL = [NSURL URLWithString:@"https://www.tiktok.com/@dtnregedit"];
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [[UIApplication sharedApplication] openURL:tiktokURL options:@{} completionHandler:nil];
                        });
                    }
                    ImGui::EndTabItem();
                }
                ImGui::EndTabBar();
            }
            ImGui::End();
        }


        get_players();
        draw_watermark();
        aimbot();
        game_sdk->init();
        Vars.isAimFov = (Vars.AimFov > 0);

        ImGui::Render();
        ImDrawData* draw_data = ImGui::GetDrawData();
        ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);

        [renderEncoder popDebugGroup];
        [renderEncoder endEncoding];

        [commandBuffer presentDrawable:view.currentDrawable];
    }

    [commandBuffer commit];
}


- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size
{
    
}

@end


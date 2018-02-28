/*
 * Insert sample data into the databse.
 */

-- Sample tuples into the person table
insert into person values
     (1, 'Jeff Bezos', '7801331224', 'jeffy@amazon.com'),
     (2, 'Tamir Bennatan', '188812213', 'timib@amazon.com'),
     (3, 'Jeff Dean', '7842993952', 'chiefjeff@amazon.com'),
     (4, 'Ben Tau', '1849482841', 'bennyboo@amazon.com'),
     (5, 'Paul Line', '9993991113', 'pauline@amazon.com'),
     (6, 'Benji Taubenblatt','1234432155','benji@mail.mcgill.ca'),
     (7, 'Eric Andre', '82746465724', 'ericandre@gmail.com'),
     (8, 'Tif Fany', '3824832238', 'tiff@email.com'),
     (9, 'Joe Rogan', '9783224258', 'therealjoe@joe.com'),
     (10, 'Max Mcdan', '1984839591' , 'max@hotmail.com'),
     (11, 'Jimmy Kim', '2948422039', 'jimmk@yahoo.com'),
     (12, 'Jenny Bass', '23855391285', 'jenb@gmail.com'),
     (13, 'Dennis Misty', '2484829492', 'missdennis@yahoo.com'),
     (14, 'Jeffery Cost', '3942349492', 'costlyjeff@gmail.com'),
     (15, 'Tim Chooch', '18883942322', 'tim.chooch@gmail.com'),
     (16, 'Colonel Moostard', '2352556245', 'innocentcolonel@gmail.com'),
     (17, 'Foo Kyoo', '235925924', 'kfoo@yahoo.com'),
     (18, 'Amir Ben-Yehuda', '23345524524', 'amirby@hotmail.com'),
     (19, 'Omer Tsion', '2939482948', 'omertz@yahoo.com'),
     (20, 'Sammy Sprinkle', '2938581948', 'sammyspk@hotmail.com'),
     (21, 'Mary Smith', '8456227719', 'Mary.Smith@gmail.com'),
    (22, 'Mary Hall', '6630161884', 'Mary.Hall@gmail.com'),
    (23, 'Mary Wilson', '3897019276', 'Mary.Wilson@gmail.com'),
    (24, 'Mary Anderson', '6310630237', 'Mary.Anderson@gmail.com'),
    (25, 'Mary Thomas', '9695948083', 'Mary.Thomas@gmail.com'),
    (26, 'Mary Nelson', '6416033330', 'Mary.Nelson@gmail.com'),
    (27, 'Mary White', '2430917340', 'Mary.White@gmail.com'),
    (28, 'Mary Gonzalez', '0601840957', 'Mary.Gonzalez@gmail.com'),
    (29, 'Mary Baker', '9351659997', 'Mary.Baker@gmail.com'),
    (30, 'Mary Davis', '5904954982', 'Mary.Davis@gmail.com'),
    (31, 'Mary Lewis', '3496147426', 'Mary.Lewis@gmail.com'),
    (32, 'Mary Walker', '6053527496', 'Mary.Walker@gmail.com'),
    (33, 'Mary Edwards', '5602575960', 'Mary.Edwards@gmail.com'),
    (34, 'Mary Collins', '5221717727', 'Mary.Collins@gmail.com'),
    (35, 'Mary Turner', '0608046420', 'Mary.Turner@gmail.com'),
    (36, 'Mary Phillips', '3532275523', 'Mary.Phillips@gmail.com'),
    (37, 'Mary Campbell', '4126500229', 'Mary.Campbell@gmail.com'),
    (38, 'Pat Smith', '1993683406', 'Pat.Smith@gmail.com'),
    (39, 'Pat Hall', '8801052312', 'Pat.Hall@gmail.com'),
    (40, 'Pat Wilson', '4241197773', 'Pat.Wilson@gmail.com'),
    (41, 'Pat Anderson', '6623856654', 'Pat.Anderson@gmail.com'),
    (42, 'Pat Thomas', '7135464494', 'Pat.Thomas@gmail.com'),
    (43, 'Pat Nelson', '7432830602', 'Pat.Nelson@gmail.com'),
    (44, 'Pat White', '7211152909', 'Pat.White@gmail.com'),
    (45, 'Pat Gonzalez', '7522085016', 'Pat.Gonzalez@gmail.com'),
    (46, 'Pat Baker', '2515806941', 'Pat.Baker@gmail.com'),
    (47, 'Pat Davis', '9764036766', 'Pat.Davis@gmail.com'),
    (48, 'Pat Lewis', '1510097537', 'Pat.Lewis@gmail.com'),
    (49, 'Pat Walker', '9186473950', 'Pat.Walker@gmail.com'),
    (50, 'Pat Edwards', '8545687752', 'Pat.Edwards@gmail.com'),
    (51, 'Pat Collins', '8521642911', 'Pat.Collins@gmail.com'),
    (52, 'Pat Turner', '0528112548', 'Pat.Turner@gmail.com'),
    (53, 'Pat Phillips', '0912180834', 'Pat.Phillips@gmail.com'),
    (54, 'Pat Campbell', '8130558022', 'Pat.Campbell@gmail.com'),
    (55, 'Marge Smith', '4691668264', 'Marge.Smith@gmail.com'),
    (56, 'Marge Hall', '3702531911', 'Marge.Hall@gmail.com'),
    (57, 'Marge Wilson', '9846874722', 'Marge.Wilson@gmail.com'),
    (58, 'Marge Anderson', '0401179352', 'Marge.Anderson@gmail.com'),
    (59, 'Marge Thomas', '5314650538', 'Marge.Thomas@gmail.com'),
    (60, 'Marge Nelson', '4433497761', 'Marge.Nelson@gmail.com'),
    (61, 'Marge White', '1282031230', 'Marge.White@gmail.com'),
    (62, 'Marge Gonzalez', '3951882627', 'Marge.Gonzalez@gmail.com'),
    (63, 'Marge Baker', '7076474048', 'Marge.Baker@gmail.com'),
    (64, 'Marge Davis', '8823156092', 'Marge.Davis@gmail.com'),
    (65, 'Marge Lewis', '0246197114', 'Marge.Lewis@gmail.com'),
    (66, 'Marge Walker', '5245095586', 'Marge.Walker@gmail.com'),
    (67, 'Marge Edwards', '0903765950', 'Marge.Edwards@gmail.com'),
    (68, 'Marge Collins', '8003934571', 'Marge.Collins@gmail.com'),
    (69, 'Marge Turner', '0857852794', 'Marge.Turner@gmail.com'),
    (70, 'Marge Phillips', '0341933210', 'Marge.Phillips@gmail.com'),
    (71, 'Marge Campbell', '3842362020', 'Marge.Campbell@gmail.com'),
    (72, 'Jessica Smith', '7326061745', 'Jessica.Smith@gmail.com'),
    (73, 'Jessica Hall', '3132066930', 'Jessica.Hall@gmail.com'),
    (74, 'Jessica Wilson', '1300048996', 'Jessica.Wilson@gmail.com'),
    (75, 'Jessica Anderson', '7945722220', 'Jessica.Anderson@gmail.com'),
    (76, 'Jessica Thomas', '8069193818', 'Jessica.Thomas@gmail.com'),
    (77, 'Jessica Nelson', '8558597987', 'Jessica.Nelson@gmail.com'),
    (78, 'Jessica White', '3037444732', 'Jessica.White@gmail.com'),
    (79, 'Jessica Gonzalez', '4248303610', 'Jessica.Gonzalez@gmail.com'),
    (80, 'Jessica Baker', '2453899942', 'Jessica.Baker@gmail.com'),
    (81, 'Jessica Davis', '5571774930', 'Jessica.Davis@gmail.com'),
    (82, 'Jessica Lewis', '3301071667', 'Jessica.Lewis@gmail.com'),
    (83, 'Jessica Walker', '3386633359', 'Jessica.Walker@gmail.com'),
    (84, 'Jessica Edwards', '7836214184', 'Jessica.Edwards@gmail.com'),
    (85, 'Jessica Collins', '9562961600', 'Jessica.Collins@gmail.com'),
    (86, 'Jessica Turner', '5841403192', 'Jessica.Turner@gmail.com'),
    (87, 'Jessica Phillips', '1046879301', 'Jessica.Phillips@gmail.com'),
    (88, 'Jessica Campbell', '6525749326', 'Jessica.Campbell@gmail.com'),
    (89, 'Shirly Smith', '4486117178', 'Shirly.Smith@gmail.com'),
    (90, 'Shirly Hall', '9880305570', 'Shirly.Hall@gmail.com'),
    (91, 'Shirly Wilson', '7193814951', 'Shirly.Wilson@gmail.com'),
    (92, 'Shirly Anderson', '8347861065', 'Shirly.Anderson@gmail.com'),
    (93, 'Shirly Thomas', '7012862601', 'Shirly.Thomas@gmail.com'),
    (94, 'Shirly Nelson', '5356190057', 'Shirly.Nelson@gmail.com'),
    (95, 'Shirly White', '8968183918', 'Shirly.White@gmail.com'),
    (96, 'Shirly Gonzalez', '8316170647', 'Shirly.Gonzalez@gmail.com'),
    (97, 'Shirly Baker', '2913258876', 'Shirly.Baker@gmail.com'),
    (98, 'Shirly Davis', '1570318952', 'Shirly.Davis@gmail.com'),
    (99, 'Shirly Lewis', '3703518687', 'Shirly.Lewis@gmail.com'),
    (100, 'Shirly Walker', '5210776725', 'Shirly.Walker@gmail.com'),
    (101, 'Shirly Edwards', '0973800898', 'Shirly.Edwards@gmail.com'),
    (102, 'Shirly Collins', '3453792864', 'Shirly.Collins@gmail.com'),
    (103, 'Shirly Turner', '5749056642', 'Shirly.Turner@gmail.com'),
    (104, 'Shirly Phillips', '0435746185', 'Shirly.Phillips@gmail.com'),
    (105, 'Shirly Campbell', '8149486765', 'Shirly.Campbell@gmail.com'),
    (106, 'Viginia Smith', '6511170456', 'Viginia.Smith@gmail.com'),
    (107, 'Viginia Hall', '3136501715', 'Viginia.Hall@gmail.com'),
    (108, 'Viginia Wilson', '2983209812', 'Viginia.Wilson@gmail.com'),
    (109, 'Viginia Anderson', '3526161407', 'Viginia.Anderson@gmail.com'),
    (110, 'Viginia Thomas', '3252886962', 'Viginia.Thomas@gmail.com'),
    (111, 'Viginia Nelson', '7485137769', 'Viginia.Nelson@gmail.com'),
    (112, 'Viginia White', '5010568574', 'Viginia.White@gmail.com'),
    (113, 'Viginia Gonzalez', '5261283972', 'Viginia.Gonzalez@gmail.com'),
    (114, 'Viginia Baker', '1487564989', 'Viginia.Baker@gmail.com'),
    (115, 'Viginia Davis', '9144180024', 'Viginia.Davis@gmail.com'),
    (116, 'Viginia Lewis', '3255729286', 'Viginia.Lewis@gmail.com'),
    (117, 'Viginia Walker', '3275644523', 'Viginia.Walker@gmail.com'),
    (118, 'Viginia Edwards', '0688461396', 'Viginia.Edwards@gmail.com'),
    (119, 'Viginia Collins', '9794115817', 'Viginia.Collins@gmail.com'),
    (120, 'Viginia Turner', '4796978418', 'Viginia.Turner@gmail.com'),
    (121, 'Viginia Phillips', '9128847372', 'Viginia.Phillips@gmail.com'),
    (122, 'Viginia Campbell', '9276172424', 'Viginia.Campbell@gmail.com'),
    (123, 'Rebecca Smith', '9697521431', 'Rebecca.Smith@gmail.com'),
    (124, 'Rebecca Hall', '8156292877', 'Rebecca.Hall@gmail.com'),
    (125, 'Rebecca Wilson', '9254432251', 'Rebecca.Wilson@gmail.com'),
    (126, 'Rebecca Anderson', '9222893236', 'Rebecca.Anderson@gmail.com'),
    (127, 'Rebecca Thomas', '8013676781', 'Rebecca.Thomas@gmail.com'),
    (128, 'Rebecca Nelson', '1345812160', 'Rebecca.Nelson@gmail.com'),
    (129, 'Rebecca White', '5237117222', 'Rebecca.White@gmail.com'),
    (130, 'Rebecca Gonzalez', '5756040130', 'Rebecca.Gonzalez@gmail.com'),
    (131, 'Rebecca Baker', '9924975279', 'Rebecca.Baker@gmail.com'),
    (132, 'Rebecca Davis', '7839485499', 'Rebecca.Davis@gmail.com'),
    (133, 'Rebecca Lewis', '7029162166', 'Rebecca.Lewis@gmail.com'),
    (134, 'Rebecca Walker', '7466490368', 'Rebecca.Walker@gmail.com'),
    (135, 'Rebecca Edwards', '3615777640', 'Rebecca.Edwards@gmail.com'),
    (136, 'Rebecca Collins', '9423135578', 'Rebecca.Collins@gmail.com'),
    (137, 'Rebecca Turner', '6435008896', 'Rebecca.Turner@gmail.com'),
    (138, 'Rebecca Phillips', '4025746085', 'Rebecca.Phillips@gmail.com'),
    (139, 'Rebecca Campbell', '4645715772', 'Rebecca.Campbell@gmail.com'),
    (140, 'Martha Smith', '9797549273', 'Martha.Smith@gmail.com'),
    (141, 'Martha Hall', '5321283974', 'Martha.Hall@gmail.com'),
    (142, 'Martha Wilson', '1677975358', 'Martha.Wilson@gmail.com'),
    (143, 'Martha Anderson', '1483549941', 'Martha.Anderson@gmail.com'),
    (144, 'Martha Thomas', '6872421966', 'Martha.Thomas@gmail.com'),
    (145, 'Martha Nelson', '5627755309', 'Martha.Nelson@gmail.com'),
    (146, 'Martha White', '9068062611', 'Martha.White@gmail.com'),
    (147, 'Martha Gonzalez', '1846003440', 'Martha.Gonzalez@gmail.com'),
    (148, 'Martha Baker', '4111088137', 'Martha.Baker@gmail.com'),
    (149, 'Martha Davis', '7279602186', 'Martha.Davis@gmail.com'),
    (150, 'Martha Lewis', '0501050339', 'Martha.Lewis@gmail.com'),
    (151, 'Martha Walker', '0992224065', 'Martha.Walker@gmail.com'),
    (152, 'Martha Edwards', '5457079014', 'Martha.Edwards@gmail.com'),
    (153, 'Martha Collins', '2657292165', 'Martha.Collins@gmail.com'),
    (154, 'Martha Turner', '1069375962', 'Martha.Turner@gmail.com'),
    (155, 'Martha Phillips', '2616975684', 'Martha.Phillips@gmail.com'),
    (156, 'Martha Campbell', '6321410877', 'Martha.Campbell@gmail.com'),
    (157, 'Amanda Smith', '5263774368', 'Amanda.Smith@gmail.com'),
    (158, 'Amanda Hall', '0784967605', 'Amanda.Hall@gmail.com'),
    (159, 'Amanda Wilson', '0728114455', 'Amanda.Wilson@gmail.com'),
    (160, 'Amanda Anderson', '8506269918', 'Amanda.Anderson@gmail.com'),
    (161, 'Amanda Thomas', '6432389604', 'Amanda.Thomas@gmail.com'),
    (162, 'Amanda Nelson', '1733672582', 'Amanda.Nelson@gmail.com'),
    (163, 'Amanda White', '8618340673', 'Amanda.White@gmail.com'),
    (164, 'Amanda Gonzalez', '0218493833', 'Amanda.Gonzalez@gmail.com'),
    (165, 'Amanda Baker', '3681047923', 'Amanda.Baker@gmail.com'),
    (166, 'Amanda Davis', '8476297370', 'Amanda.Davis@gmail.com'),
    (167, 'Amanda Lewis', '7102784127', 'Amanda.Lewis@gmail.com'),
    (168, 'Amanda Walker', '2837524057', 'Amanda.Walker@gmail.com'),
    (169, 'Amanda Edwards', '8912814945', 'Amanda.Edwards@gmail.com'),
    (170, 'Amanda Collins', '5980780012', 'Amanda.Collins@gmail.com'),
    (171, 'Amanda Turner', '8654933191', 'Amanda.Turner@gmail.com'),
    (172, 'Amanda Phillips', '8927933740', 'Amanda.Phillips@gmail.com'),
    (173, 'Amanda Campbell', '4254440773', 'Amanda.Campbell@gmail.com'),
    (174, 'Carole Smith', '6756003377', 'Carole.Smith@gmail.com'),
    (175, 'Carole Hall', '5444763147', 'Carole.Hall@gmail.com'),
    (176, 'Carole Wilson', '9447352378', 'Carole.Wilson@gmail.com'),
    (177, 'Carole Anderson', '7981607428', 'Carole.Anderson@gmail.com'),
    (178, 'Carole Thomas', '7258185004', 'Carole.Thomas@gmail.com'),
    (179, 'Carole Nelson', '8140323746', 'Carole.Nelson@gmail.com'),
    (180, 'Carole White', '9981599522', 'Carole.White@gmail.com'),
    (181, 'Carole Gonzalez', '2565611854', 'Carole.Gonzalez@gmail.com'),
    (182, 'Carole Baker', '2013636306', 'Carole.Baker@gmail.com'),
    (183, 'Carole Davis', '7467828134', 'Carole.Davis@gmail.com'),
    (184, 'Carole Lewis', '7703325106', 'Carole.Lewis@gmail.com'),
    (185, 'Carole Walker', '5142837977', 'Carole.Walker@gmail.com'),
    (186, 'Carole Edwards', '4870758136', 'Carole.Edwards@gmail.com'),
    (187, 'Carole Collins', '4037430704', 'Carole.Collins@gmail.com'),
    (188, 'Carole Turner', '8826969303', 'Carole.Turner@gmail.com'),
    (189, 'Carole Phillips', '7962318776', 'Carole.Phillips@gmail.com'),
    (190, 'Carole Campbell', '5845975982', 'Carole.Campbell@gmail.com'),
    (191, 'Deborah Smith', '0401190843', 'Deborah.Smith@gmail.com'),
    (192, 'Deborah Hall', '8511415942', 'Deborah.Hall@gmail.com'),
    (193, 'Deborah Wilson', '4584536776', 'Deborah.Wilson@gmail.com'),
    (194, 'Deborah Anderson', '1897605282', 'Deborah.Anderson@gmail.com'),
    (195, 'Deborah Thomas', '2993542752', 'Deborah.Thomas@gmail.com'),
    (196, 'Deborah Nelson', '6913344758', 'Deborah.Nelson@gmail.com'),
    (197, 'Deborah White', '0055070783', 'Deborah.White@gmail.com'),
    (198, 'Deborah Gonzalez', '1200446473', 'Deborah.Gonzalez@gmail.com'),
    (199, 'Deborah Baker', '3026536368', 'Deborah.Baker@gmail.com'),
    (200, 'Deborah Davis', '8871913551', 'Deborah.Davis@gmail.com'),
    (201, 'Deborah Lewis', '7468604394', 'Deborah.Lewis@gmail.com'),
    (202, 'Deborah Walker', '9707917256', 'Deborah.Walker@gmail.com'),
    (203, 'Deborah Edwards', '5430287394', 'Deborah.Edwards@gmail.com'),
    (204, 'Deborah Collins', '5719682275', 'Deborah.Collins@gmail.com'),
    (205, 'Deborah Turner', '5513768068', 'Deborah.Turner@gmail.com'),
    (206, 'Deborah Phillips', '5256272138', 'Deborah.Phillips@gmail.com'),
    (207, 'Deborah Campbell', '5420405711', 'Deborah.Campbell@gmail.com'),
    (208, 'Julia Smith', '8185675511', 'Julia.Smith@gmail.com'),
    (209, 'Julia Hall', '9533687347', 'Julia.Hall@gmail.com'),
    (210, 'Julia Wilson', '4083007693', 'Julia.Wilson@gmail.com'),
    (211, 'Julia Anderson', '6299652426', 'Julia.Anderson@gmail.com'),
    (212, 'Julia Thomas', '3077594075', 'Julia.Thomas@gmail.com'),
    (213, 'Julia Nelson', '3019103864', 'Julia.Nelson@gmail.com'),
    (214, 'Julia White', '5063173505', 'Julia.White@gmail.com'),
    (215, 'Julia Gonzalez', '5862676586', 'Julia.Gonzalez@gmail.com'),
    (216, 'Julia Baker', '5499944669', 'Julia.Baker@gmail.com'),
    (217, 'Julia Davis', '9765797032', 'Julia.Davis@gmail.com'),
    (218, 'Julia Lewis', '1629712376', 'Julia.Lewis@gmail.com'),
    (219, 'Julia Walker', '6366644129', 'Julia.Walker@gmail.com'),
    (220, 'Julia Edwards', '9945310087', 'Julia.Edwards@gmail.com'),
    (221, 'Julia Collins', '7361352865', 'Julia.Collins@gmail.com'),
    (222, 'Julia Turner', '5659085142', 'Julia.Turner@gmail.com'),
    (223, 'Julia Phillips', '3683631525', 'Julia.Phillips@gmail.com'),
    (224, 'Julia Campbell', '4021388834', 'Julia.Campbell@gmail.com'),
    (225, 'Wanda Smith', '9365230922', 'Wanda.Smith@gmail.com'),
    (226, 'Wanda Hall', '8953304495', 'Wanda.Hall@gmail.com'),
    (227, 'Wanda Wilson', '6696762890', 'Wanda.Wilson@gmail.com'),
    (228, 'Wanda Anderson', '8987478918', 'Wanda.Anderson@gmail.com'),
    (229, 'Wanda Thomas', '9251636496', 'Wanda.Thomas@gmail.com'),
    (230, 'Wanda Nelson', '8463435694', 'Wanda.Nelson@gmail.com'),
    (231, 'Wanda White', '3834161927', 'Wanda.White@gmail.com'),
    (232, 'Wanda Gonzalez', '4643646424', 'Wanda.Gonzalez@gmail.com'),
    (233, 'Wanda Baker', '7959075032', 'Wanda.Baker@gmail.com'),
    (234, 'Wanda Davis', '3726330297', 'Wanda.Davis@gmail.com'),
    (235, 'Wanda Lewis', '7493638087', 'Wanda.Lewis@gmail.com'),
    (236, 'Wanda Walker', '4814203811', 'Wanda.Walker@gmail.com'),
    (237, 'Wanda Edwards', '3365413053', 'Wanda.Edwards@gmail.com'),
    (238, 'Wanda Collins', '4561482876', 'Wanda.Collins@gmail.com'),
    (239, 'Wanda Turner', '1165094560', 'Wanda.Turner@gmail.com'),
    (240, 'Wanda Phillips', '3544967557', 'Wanda.Phillips@gmail.com'),
    (241, 'Wanda Campbell', '4151944305', 'Wanda.Campbell@gmail.com'),
    (242, 'Wendy Smith', '0181635766', 'Wendy.Smith@gmail.com'),
    (243, 'Wendy Hall', '1720739738', 'Wendy.Hall@gmail.com'),
    (244, 'Wendy Wilson', '2602330473', 'Wendy.Wilson@gmail.com'),
    (245, 'Wendy Anderson', '8578840280', 'Wendy.Anderson@gmail.com'),
    (246, 'Wendy Thomas', '5895771368', 'Wendy.Thomas@gmail.com'),
    (247, 'Wendy Nelson', '2871449064', 'Wendy.Nelson@gmail.com'),
    (248, 'Wendy White', '9977266968', 'Wendy.White@gmail.com'),
    (249, 'Wendy Gonzalez', '2579206000', 'Wendy.Gonzalez@gmail.com'),
    (250, 'Wendy Baker', '5137883371', 'Wendy.Baker@gmail.com'),
    (251, 'Wendy Davis', '7395197854', 'Wendy.Davis@gmail.com'),
    (252, 'Wendy Lewis', '6913205405', 'Wendy.Lewis@gmail.com'),
    (253, 'Wendy Walker', '4335026840', 'Wendy.Walker@gmail.com'),
    (254, 'Wendy Edwards', '7769976922', 'Wendy.Edwards@gmail.com'),
    (255, 'Wendy Collins', '4857941062', 'Wendy.Collins@gmail.com'),
    (256, 'Wendy Turner', '7154650675', 'Wendy.Turner@gmail.com'),
    (257, 'Wendy Phillips', '4913765411', 'Wendy.Phillips@gmail.com'),
    (258, 'Wendy Campbell', '9714946851', 'Wendy.Campbell@gmail.com'),
    (259, 'Thelma Smith', '7161799402', 'Thelma.Smith@gmail.com'),
    (260, 'Thelma Hall', '0913772364', 'Thelma.Hall@gmail.com'),
    (261, 'Thelma Wilson', '1294701263', 'Thelma.Wilson@gmail.com'),
    (262, 'Thelma Anderson', '9665147971', 'Thelma.Anderson@gmail.com'),
    (263, 'Thelma Thomas', '2292283753', 'Thelma.Thomas@gmail.com'),
    (264, 'Thelma Nelson', '0261360489', 'Thelma.Nelson@gmail.com'),
    (265, 'Thelma White', '2532237481', 'Thelma.White@gmail.com'),
    (266, 'Thelma Gonzalez', '4797870574', 'Thelma.Gonzalez@gmail.com'),
    (267, 'Thelma Baker', '9521685622', 'Thelma.Baker@gmail.com'),
    (268, 'Thelma Davis', '3991299021', 'Thelma.Davis@gmail.com'),
    (269, 'Thelma Lewis', '7235055877', 'Thelma.Lewis@gmail.com'),
    (270, 'Thelma Walker', '8343625217', 'Thelma.Walker@gmail.com'),
    (271, 'Thelma Edwards', '0891620176', 'Thelma.Edwards@gmail.com'),
    (272, 'Thelma Collins', '6118919548', 'Thelma.Collins@gmail.com'),
    (273, 'Thelma Turner', '9957843575', 'Thelma.Turner@gmail.com'),
    (274, 'Thelma Phillips', '5495959685', 'Thelma.Phillips@gmail.com'),
    (275, 'Thelma Campbell', '5344861777', 'Thelma.Campbell@gmail.com'),
    (276, 'Shannon Smith', '3467025387', 'Shannon.Smith@gmail.com'),
    (277, 'Shannon Hall', '9461053956', 'Shannon.Hall@gmail.com'),
    (278, 'Shannon Wilson', '9695992389', 'Shannon.Wilson@gmail.com'),
    (279, 'Shannon Anderson', '1031698490', 'Shannon.Anderson@gmail.com'),
    (280, 'Shannon Thomas', '5528338602', 'Shannon.Thomas@gmail.com'),
    (281, 'Shannon Nelson', '4196292298', 'Shannon.Nelson@gmail.com'),
    (282, 'Shannon White', '6716461609', 'Shannon.White@gmail.com'),
    (283, 'Shannon Gonzalez', '1186466365', 'Shannon.Gonzalez@gmail.com'),
    (284, 'Shannon Baker', '2653342908', 'Shannon.Baker@gmail.com'),
    (285, 'Shannon Davis', '2787533788', 'Shannon.Davis@gmail.com'),
    (286, 'Shannon Lewis', '4797129393', 'Shannon.Lewis@gmail.com'),
    (287, 'Shannon Walker', '7932828344', 'Shannon.Walker@gmail.com'),
    (288, 'Shannon Edwards', '8578475121', 'Shannon.Edwards@gmail.com'),
    (289, 'Shannon Collins', '7864236400', 'Shannon.Collins@gmail.com'),
    (290, 'Shannon Turner', '6768068346', 'Shannon.Turner@gmail.com'),
    (291, 'Shannon Phillips', '0871927579', 'Shannon.Phillips@gmail.com'),
    (292, 'Shannon Campbell', '3897170731', 'Shannon.Campbell@gmail.com'),
    (293, 'Megan Smith', '6687016222', 'Megan.Smith@gmail.com'),
    (294, 'Megan Hall', '2942477813', 'Megan.Hall@gmail.com'),
    (295, 'Megan Wilson', '5078183971', 'Megan.Wilson@gmail.com'),
    (296, 'Megan Anderson', '9050783618', 'Megan.Anderson@gmail.com'),
    (297, 'Megan Thomas', '1161570370', 'Megan.Thomas@gmail.com'),
    (298, 'Megan Nelson', '8538766539', 'Megan.Nelson@gmail.com'),
    (299, 'Megan White', '1058296721', 'Megan.White@gmail.com'),
    (300, 'Megan Gonzalez', '3863644347', 'Megan.Gonzalez@gmail.com'),
    (301, 'Megan Baker', '9053894035', 'Megan.Baker@gmail.com'),
    (302, 'Megan Davis', '2012000617', 'Megan.Davis@gmail.com'),
    (303, 'Megan Lewis', '5207426269', 'Megan.Lewis@gmail.com'),
    (304, 'Megan Walker', '4166040326', 'Megan.Walker@gmail.com'),
    (305, 'Megan Edwards', '8879472832', 'Megan.Edwards@gmail.com'),
    (306, 'Megan Collins', '9920646960', 'Megan.Collins@gmail.com'),
    (307, 'Megan Turner', '2885925611', 'Megan.Turner@gmail.com'),
    (308, 'Megan Phillips', '4924765425', 'Megan.Phillips@gmail.com'),
    (309, 'Megan Campbell', '8950051502', 'Megan.Campbell@gmail.com'),
    (310, 'Bertha Smith', '5447956764', 'Bertha.Smith@gmail.com'),
    (311, 'Bertha Hall', '2146249397', 'Bertha.Hall@gmail.com'),
    (312, 'Bertha Wilson', '7596623124', 'Bertha.Wilson@gmail.com'),
    (313, 'Bertha Anderson', '3370892991', 'Bertha.Anderson@gmail.com'),
    (314, 'Bertha Thomas', '4859743721', 'Bertha.Thomas@gmail.com'),
    (315, 'Bertha Nelson', '0085619073', 'Bertha.Nelson@gmail.com'),
    (316, 'Bertha White', '9889670441', 'Bertha.White@gmail.com'),
    (317, 'Bertha Gonzalez', '6572823624', 'Bertha.Gonzalez@gmail.com'),
    (318, 'Bertha Baker', '9258128470', 'Bertha.Baker@gmail.com'),
    (319, 'Bertha Davis', '9686852820', 'Bertha.Davis@gmail.com'),
    (320, 'Bertha Lewis', '2675336827', 'Bertha.Lewis@gmail.com'),
    (321, 'Bertha Walker', '5405359761', 'Bertha.Walker@gmail.com'),
    (322, 'Bertha Edwards', '4402512334', 'Bertha.Edwards@gmail.com'),
    (323, 'Bertha Collins', '7598552175', 'Bertha.Collins@gmail.com'),
    (324, 'Bertha Turner', '8423856653', 'Bertha.Turner@gmail.com'),
    (325, 'Bertha Phillips', '2285601609', 'Bertha.Phillips@gmail.com'),
    (326, 'Bertha Campbell', '2745646630', 'Bertha.Campbell@gmail.com'),
    (327, 'Stacey Smith', '7062615472', 'Stacey.Smith@gmail.com'),
    (328, 'Stacey Hall', '4116430517', 'Stacey.Hall@gmail.com'),
    (329, 'Stacey Wilson', '1302015353', 'Stacey.Wilson@gmail.com'),
    (330, 'Stacey Anderson', '1953105882', 'Stacey.Anderson@gmail.com'),
    (331, 'Stacey Thomas', '5608493136', 'Stacey.Thomas@gmail.com'),
    (332, 'Stacey Nelson', '5984944470', 'Stacey.Nelson@gmail.com'),
    (333, 'Stacey White', '9600715716', 'Stacey.White@gmail.com'),
    (334, 'Stacey Gonzalez', '5327799531', 'Stacey.Gonzalez@gmail.com'),
    (335, 'Stacey Baker', '6089807637', 'Stacey.Baker@gmail.com'),
    (336, 'Stacey Davis', '1488547544', 'Stacey.Davis@gmail.com'),
    (337, 'Stacey Lewis', '4138019179', 'Stacey.Lewis@gmail.com'),
    (338, 'Stacey Walker', '2797912916', 'Stacey.Walker@gmail.com'),
    (339, 'Stacey Edwards', '6954228379', 'Stacey.Edwards@gmail.com'),
    (340, 'Stacey Collins', '2670572511', 'Stacey.Collins@gmail.com'),
    (341, 'Stacey Turner', '2144003100', 'Stacey.Turner@gmail.com'),
    (342, 'Stacey Phillips', '3676843985', 'Stacey.Phillips@gmail.com'),
    (343, 'Stacey Campbell', '4705490562', 'Stacey.Campbell@gmail.com');



insert into clientcompany values
    (1,'Mango Madness Inc', 30),
    (2,'Killa Bee Records', 25),
    (3,'Seal Brigade Sofas', 30),
    (4,'Al and Co Solutions', 40),
    (5,'Good ol Beef Jerky', 35),
    (6,'Atmosphere Visual Effects', 40),
    (7,'ATB Financial', 20),
    (8,'Bank of Montreal', 30),
    (9,'Bard Ventures', 35),
    (10,'Pure Gold',35) ;

insert into team values
    ('Web Dev'),
    ('Management'),
    ('HR'),
    ('Ad Operations'),
    ('Support'),
    ('Core Dev'),
    ('Data Science'),
    ('Public Relations'),
    ('Sales'),
    ('Office Management');


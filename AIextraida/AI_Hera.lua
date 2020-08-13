-- AI_Hera.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Hera_Wait.frm",
        Func    = "Hera_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 30,
                AIFunc              = "Hera_Check_Targeting",
                DelayFrame          = 70,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 40,
                AIFunc              = "Hera_Check_TurnToTarget",
                DelayFrame          = 80,
            },

            -- �̵�
            {
                AICheckFrame        = 102,
                AIFunc              = "Hera_Check_Walk",
                DelayFrame          = 102,
            },			

			-- �����̵�
            {
                AICheckFrame        = 101,
                AIFunc              = "Hera_Check_MoveUp",
                DelayFrame          = 101,
            },

			-- �Ʒ����̵�
            {
                AICheckFrame        = 101,
                AIFunc              = "Hera_Check_MoveDown",
                DelayFrame          = 101,
            },

            -- �λ�
            {
                AICheckFrame        = 20,
                AIFunc              = "Hera_Check_Attack01",
                DelayFrame          = 180,
				DelayFrame1			= 120,
				DelayFrame2			= 60,
				DelayFrame3			= 60,
            },

            -- ������
            {
                AICheckFrame        = 180,
                AIFunc              = "Hera_Check_Attack02",
                DelayFrame          = 120,
				DelayFrame1			= 80,
				DelayFrame2			= 40,
				DelayFrame3			= 40,
            },

            -- ������ ����
            {
                AICheckFrame        = 66,
                AIFunc              = "Hera_Check_Attack03",
                DelayFrame          = 366,
				DelayFrame1			= 244,
				DelayFrame2			= 122,
				DelayFrame3			= 122,
            },

            -- ������ ���� [60%]
            {
                AICheckFrame        = 160,
                AIFunc              = "Hera_Check_Attack04",
                DelayFrame          = 560,
				DelayFrame1			= 440,
				DelayFrame2			= 320,
				DelayFrame3			= 320,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "hera_move.frm",
        Func    = "Hera_WalkFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Hera_Check_Targeting",
                DelayFrame          = 65,
            },
            -- ����
            {
                AICheckFrame        = 30,
                AIFunc              = "Hera_Check_Stop",
                DelayFrame          = 90,
            },            
        }
    },
	
	-- �����̵�
    {
        ID      = "MOVE_UP",
        Motion  = "hera_move.frm",
        Func    = "Hera_MoveUpFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Hera_Check_Targeting",
                DelayFrame          = 65,
            },
            -- ����
            {
                AICheckFrame        = 5,
                AIFunc              = "Hera_Check_MoveUpStop",
                DelayFrame          = 10,
            },            
        }
    },
	
	-- �Ʒ����̵�
    {
        ID      = "MOVE_DOWN",
        Motion  = "hera_move.frm",
        Func    = "Hera_MoveDownFunc",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "Hera_Check_Targeting",
                DelayFrame          = 65,
            },
            -- ����
            {
                AICheckFrame        = 5,
                AIFunc              = "Hera_Check_MoveDownStop",
                DelayFrame          = 10,
            },            
        }
    },
    
    -- ��~��~���̾
    {
        ID      = "ATTACK01",
        Motion  = "Hera_Attack01.frm",
        Func    = "Hera_Attack01Func",
    },
    
    -- ȸ�� �� ȸ����~
    {
        ID      = "ATTACK02",
        Motion  = "Hera_Attack02.frm",
        Func    = "Hera_Attack02Func",
    },
    
    -- ����
    {
        ID      = "ATTACK03_R",
        Motion  = "Hera_Attack03_01.frm",
        Func    = "Hera_Attack03Func",
    },
    
    -- ����
    {
        ID      = "ATTACK03_L",
        Motion  = "Hera_Attack03_02.frm",
        Func    = "Hera_Attack03Func",
    },
    
    -- ���� �غ�
    {
        ID      = "ATTACK04_START_R",
        Motion  = "Hera_Attack04_01.frm",
        Func    = "Hera_Attack04StartFunc",
    },
    
    -- ���� �غ�
    {
        ID      = "ATTACK04_START_L",
        Motion  = "Hera_Attack04_02.frm",
        Func    = "Hera_Attack04StartFunc",
    },
    
    -- ���� ����
    {
        ID      = "ATTACK04_ATK_RR",
        Motion  = "Hera_Attack04_03.frm",
        Func    = "Hera_Attack04AtkFunc",
    },
    
    -- ���� ����
    {
        ID      = "ATTACK04_ATK_LL",
        Motion  = "Hera_Attack04_04.frm",
        Func    = "Hera_Attack04AtkFunc",
    },
    
    -- ���� ����
    {
        ID      = "ATTACK04_ATK_RL",
        Motion  = "Hera_Attack04_05.frm",
        Func    = "Hera_Attack04AtkFunc",
    },
    
    -- ���� ����
    {
        ID      = "ATTACK04_ATK_LR",
        Motion  = "Hera_Attack04_06.frm",
        Func    = "Hera_Attack04AtkFunc",
    },
    
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "Hera_Damage.frm",
        Func    = "Hera_DamageFunc",
    },
 
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Hera_Die.frm",
        Func    = "Hera_DieFunc",
    },
    
    {
        ID      = "STUN",
        Motion  = "Hera_Wait.frm",
        Func    = "Hera_StunFunc",
    },
}

CallBack =
{
    Land    = "OnHera_Land",
    Die     = "OnHera_Die",
    Damage  = "OnHera_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitHera( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "DAMAGE" )
	
	pMonster:SetFly( true )
	
	pMonster:AddTraceParticleToBone( "Hera_Flame_01", 1.0, 21, 3, 3, 0.0, 0.05 )
	pMonster:AddTraceParticleToBone( "Hera_Flame_02", 1.0, 21, 3, 3, 0.0, 0.05 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Hera_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ��� ����
function Hera_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- �̵� ����
function Hera_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �����̵� ����
function Hera_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedY( 0.007 )
    pMonster:SetSuperArmor( true )    
    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- �Ʒ����̵� ����
function Hera_MoveDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedY( -0.007 )
    pMonster:SetSuperArmor( true )     
    if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function Hera_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
		pMonster:SetFly( false )
	elseif( iFrame == 8 ) then
	    pMonster:PlaySound(995025)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

--  ������ ����
function Hera_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ��~��~���̾
function Hera_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
			pMonster:SetSuperArmor( true )
	elseif( iFrame == 62 ) then 
		pMonster:AddDamage(DT_HERA_HELLO_BABY)
	elseif( iFrame == 67 ) then 
		local particleX = 0.1
		local particleY = 0.6
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Hera_Face_01", particleX, particleY )
			pMonster:AddParticle( "Hera_Face_02", particleX, particleY )
			pMonster:AddParticle( "Hera_Face_03", particleX, particleY )
		else
			pMonster:AddParticleNoDirection( "Hera_Face_01_R", -particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Face_02_R", -particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Face_03_R", -particleX, particleY )
		end
		pMonster:PlaySound( 995021 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ȸ�� ��ȸ����
function Hera_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
		if( iFrame == 1 ) then 
			pMonster:AddDamage(DT_HERA_CHAOS_MAGICCIRCLE_AREA)
		end
	elseif( iFrame == 10 ) then
		pMonster:AddParticle("Hera_Circle_Start_01", 0.0, 0.45)
		pMonster:AddParticle("Hera_Circle_Start_02", 0.0, 0.45)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


function Hera_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:AddParticle("Hera_Eyebeam_Start_01", 0.0, 0.45)
	elseif( iFrame == 60 ) then
		if( pMonster:CheckState( "ATTACK03_L" ) ) then
			pMonster:AddDamage(DT_HERA_INNOCENT_EYELIGHT)
		elseif( pMonster:CheckState( "ATTACK03_R" ) ) then
			pMonster:AddDamage(DT_HERA_INNOCENT_EYELIGHT_R)
		end
	elseif( iFrame == 46 ) then
		local particleX = 0.32
		local particleY = 0.42
		
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_01",   -particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_02_R", -particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_03_R", -particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_04_R", -particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_05_R", -particleX, particleY )
	
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_01", particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_02", particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_03", particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_04", particleX, particleY )
		pMonster:AddParticleNoDirection( "Hera_Eyebeam_05", particleX, particleY )
	
		pMonster:PlaySound( 995023 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


function Hera_Attack04StartFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:StartText("DANGER")
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 6 ) then
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:CheckState( "ATTACK04_START_R" ) ) then
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK04_ATK_RR" )
			else
				pMonster:SetState( "ATTACK04_ATK_RL" )
			end
		else
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK04_ATK_LR" )
			else
				pMonster:SetState( "ATTACK04_ATK_LL" )
			end
		end
    end
end

function Hera_Attack04AtkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 34 ) then
		if( pMonster:CheckState( "ATTACK04_ATK_LL" ) ) then
			pMonster:AddDamage(DT_HERA_DEATH_BREATH)
		elseif( pMonster:CheckState( "ATTACK04_ATK_RL" ) ) then
			pMonster:AddDamage(DT_HERA_DEATH_BREATH_R)
		elseif( pMonster:CheckState( "ATTACK04_ATK_LR" ) ) then
			pMonster:AddDamage(DT_HERA_DEATH_BREATH_R)
		else
			pMonster:AddDamage(DT_HERA_DEATH_BREATH)
		end
		pMonster:PlaySound( 995024 )
	elseif( iFrame == 38 ) then
		local particleX = 0.32
		local particleY = 0.42
		if( pMonster:CheckState( "ATTACK04_ATK_LL" ) ) then
			pMonster:AddParticleNoDirection( "Hera_Breath_01_R", -particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Breath_02_R", -particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Breath_03_R", -particleX, particleY )
		elseif( pMonster:CheckState( "ATTACK04_ATK_RL" ) ) then
			pMonster:SetIsRight(false)
			pMonster:AddParticle( "Hera_Breath_01_R", particleX, particleY )
			pMonster:AddParticle( "Hera_Breath_02_R", particleX, particleY )
			pMonster:AddParticle( "Hera_Breath_03_R", particleX, particleY )
			pMonster:SetIsRight(true)
		elseif( pMonster:CheckState( "ATTACK04_ATK_LR" ) ) then
			pMonster:AddParticleNoDirection( "Hera_Breath_01", particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Breath_02", particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Breath_03", particleX, particleY )
		else
			pMonster:AddParticleNoDirection( "Hera_Breath_01", particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Breath_02", particleX, particleY )
			pMonster:AddParticleNoDirection( "Hera_Breath_03", particleX, particleY )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Hera_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -600, 500, 600, -300 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Hera_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Hera_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 800, -300, 220, 300, -80 ) == true and pMonster:FloatRand() < 0.5 ) then
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Hera_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -600, 600, 600, 60 ) == true and pMonster:FloatRand() < 0.75 ) then
        pMonster:SetState( "MOVE_UP" )
        pMonster:ResetDelay()
    end
end

function Hera_Check_MoveDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -600, 0, 600, -500 ) == true and pMonster:FloatRand() < 0.75 ) then
        pMonster:SetState( "MOVE_DOWN" )
        pMonster:ResetDelay()
    end
end

function Hera_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 500, -200, 800, 200, -800 ) == true or pMonster:CheckTargetInRange( 800, -300, 420, 300, -280 ) == false ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Hera_Check_MoveUpStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -600, 600, 600, 60 ) == false ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Hera_Check_MoveDownStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -600, 0, 600, -500 ) == false ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
end

function Hera_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 250, -200, 250, 200, -80 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Hera_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Hera_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -800, 180, 800, -50 ) == true and pMonster:FloatRand() < 0.75 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetState( "ATTACK03_R" )
			pMonster:ResetDelay()
		else
			pMonster:SetState( "ATTACK03_L" )
			pMonster:ResetDelay()
		end
    end
end

function Hera_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1000, 1000, 1000, -1000 ) == true and pMonster:FloatRand() < 0.6 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetState( "ATTACK04_START_R" )
		else
			pMonster:SetState( "ATTACK04_START_L" )
		end
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnHera_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function OnHera_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnHera_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
    pMonster:SetSpeedY( pMonster:GetSpeedY() / 5.0 )

    pMonster:SetPushCheck( true )

	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function Hera_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetIsContact() == true )then		
        if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.005 )        
            pMonster:SetIsRight( false )
        else
			pMonster:SetSpeedX( 0.005 )        
            pMonster:SetIsRight( true )            
        end    
        
        pMonster:SetState( "WALK" )		
	end
end

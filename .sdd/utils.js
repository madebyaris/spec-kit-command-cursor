// SDD Command Utilities
// Note: This is a reference implementation for the cursor commands

const fs = require('fs');
const path = require('path');

class SDDHelper {
    constructor(projectRoot = process.cwd()) {
        this.projectRoot = projectRoot;
        this.configPath = path.join(projectRoot, '.sdd', 'config.json');
        this.specsPath = path.join(projectRoot, 'specs');
    }

    // Load SDD configuration
    loadConfig() {
        try {
            const config = JSON.parse(fs.readFileSync(this.configPath, 'utf8'));
            return config;
        } catch (error) {
            throw new Error('SDD configuration not found. Run setup first.');
        }
    }

    // Get next feature number
    getNextFeatureNumber() {
        const config = this.loadConfig();
        if (!config.settings.autoNumberFeatures) return '';

        const activeDir = path.join(this.specsPath, 'active');
        if (!fs.existsSync(activeDir)) return '001';

        const features = fs.readdirSync(activeDir)
            .filter(dir => dir.startsWith('feat-'))
            .map(dir => {
                const match = dir.match(/feat-(\d+)-/);
                return match ? parseInt(match[1]) : 0;
            })
            .filter(num => num > 0);

        const maxNum = features.length > 0 ? Math.max(...features) : 0;
        return String(maxNum + 1).padStart(3, '0');
    }

    // Create feature directory
    createFeatureDir(featureName) {
        const config = this.loadConfig();
        const featureNum = this.getNextFeatureNumber();
        const dirName = `${config.settings.defaultFeaturePrefix}${featureNum}-${featureName}`;
        const featureDir = path.join(this.specsPath, 'active', dirName);

        if (!fs.existsSync(featureDir)) {
            fs.mkdirSync(featureDir, { recursive: true });
        }

        return { dirName, featureDir };
    }

    // Load template and process variables
    processTemplate(templateName, variables) {
        const config = this.loadConfig();
        const templatePath = path.join(this.projectRoot, config.settings.templates[templateName]);
        
        if (!fs.existsSync(templatePath)) {
            throw new Error(`Template not found: ${templatePath}`);
        }

        let template = fs.readFileSync(templatePath, 'utf8');
        
        // Simple template variable replacement
        for (const [key, value] of Object.entries(variables)) {
            const regex = new RegExp(`{{${key}}}`, 'g');
            template = template.replace(regex, value);
        }

        // Add current date and default values
        template = template.replace(/{{CREATED_DATE}}/g, new Date().toISOString().split('T')[0]);
        template = template.replace(/{{UPDATED_DATE}}/g, new Date().toISOString().split('T')[0]);
        
        return template;
    }

    // Generate specification file
    generateSpec(featureName, description, requirements = []) {
        const { dirName, featureDir } = this.createFeatureDir(featureName);
        
        const variables = {
            FEATURE_NAME: featureName.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase()),
            FEATURE_DESCRIPTION: description,
            STATUS: 'draft'
        };

        const specContent = this.processTemplate('spec', variables);
        const specPath = path.join(featureDir, 'spec.md');
        
        fs.writeFileSync(specPath, specContent);
        
        return { dirName, specPath };
    }

    // Generate plan file
    generatePlan(featureName) {
        const activeDir = path.join(this.specsPath, 'active');
        const featureDir = fs.readdirSync(activeDir)
            .find(dir => dir.includes(featureName));

        if (!featureDir) {
            throw new Error(`Feature '${featureName}' not found in active specs`);
        }

        const fullFeatureDir = path.join(activeDir, featureDir);
        const specPath = path.join(fullFeatureDir, 'spec.md');

        if (!fs.existsSync(specPath)) {
            throw new Error(`spec.md not found for feature '${featureName}'`);
        }

        const variables = {
            FEATURE_NAME: featureName.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase()),
            STATUS: 'planned'
        };

        const planContent = this.processTemplate('plan', variables);
        const planPath = path.join(fullFeatureDir, 'plan.md');
        
        fs.writeFileSync(planPath, planContent);
        
        return { featureDir, planPath };
    }

    // Generate tasks file
    generateTasks(featureName) {
        const activeDir = path.join(this.specsPath, 'active');
        const featureDir = fs.readdirSync(activeDir)
            .find(dir => dir.includes(featureName));

        if (!featureDir) {
            throw new Error(`Feature '${featureName}' not found in active specs`);
        }

        const fullFeatureDir = path.join(activeDir, featureDir);
        const planPath = path.join(fullFeatureDir, 'plan.md');

        if (!fs.existsSync(planPath)) {
            throw new Error(`plan.md not found for feature '${featureName}'. Run /plan first.`);
        }

        const variables = {
            FEATURE_NAME: featureName.replace(/-/g, ' ').replace(/\b\w/g, l => l.toUpperCase()),
            STATUS: 'ready'
        };

        const tasksContent = this.processTemplate('tasks', variables);
        const tasksPath = path.join(fullFeatureDir, 'tasks.md');
        
        fs.writeFileSync(tasksPath, tasksContent);
        
        return { featureDir, tasksPath };
    }

    // Update project index
    updateIndex() {
        // Implementation to update specs/index.md with current features
        // This would scan active/completed/backlog directories and update status
    }

    // Validate feature name
    validateFeatureName(name) {
        if (!name || typeof name !== 'string') {
            throw new Error('Feature name is required');
        }
        
        if (!/^[a-z0-9-]+$/.test(name)) {
            throw new Error('Feature name must contain only lowercase letters, numbers, and hyphens');
        }

        return name;
    }
}

module.exports = SDDHelper;

// Usage examples:
// const sdd = new SDDHelper();
// sdd.generateSpec('user-auth', 'User authentication system with JWT tokens');
// sdd.generatePlan('user-auth');
// sdd.generateTasks('user-auth');
